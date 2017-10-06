using System.IO;
using System.Windows.Forms;

namespace Falcon.Client.App.Utils
{
    public static class FileSystem
    {
        public const string FILE_TYPE_EXTENTION = ".data";
        public enum FileTypes
        {
            Users,
        }
           
        public static void Serialize(FileTypes FileType, string Data)
        {
            var path = Application.StartupPath + "/Data/";

            if (!DirectoryExist(path))
                CreateDirectory(path);

            File.WriteAllText(path + FileType + FILE_TYPE_EXTENTION , Data);

        }

        public static string Deserialize(FileTypes FileType)
        {
            var path = Application.StartupPath + "/Data/" + FileType + FILE_TYPE_EXTENTION;

            if (!FileExists(path))
                return null;

            return File.ReadAllText(path);
        }


        public static bool DirectoryExist(string Path)
        {
            return Directory.Exists(Path);
        }

        public static void CreateDirectory(string Path)
        {
            Directory.CreateDirectory(Path);
        }


        public static bool FileExists(string Path)
        {
            return File.Exists(Path);
        }
    }
}
