using System;
using System.Collections.Generic;
using System.IO;

namespace EyouSoft.Common.Function
{
    /// <summary>
    /// �ļ��ϴ���
    /// </summary>
    public class UploadFile
    {
        private string _UploadFileExt = ".gif,.bmp,.png,.jpg,.jpeg";
        private int _UpFolderSize = 1024;//KB

        public UploadFile()
        {
        }
        /// <summary>
        /// �ͷſռ�
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
        }
        ~UploadFile()
        {
            Dispose(false);
        }
        #region model
        /// <summary>
        /// ֧�ֵ��ļ���׺
        /// </summary>
        public string UploadFileExt
        {
            set { _UploadFileExt = value; }
            get { return _UploadFileExt; }
        }
        /// <summary>
        /// ֧�ֵ��ļ���С ��KBΪ��λ
        /// </summary>
        public int UpFolderSize
        {
            set
            {
                _UpFolderSize = value;
            }
            get
            {
                return _UpFolderSize;
            }
        }
        /// <summary>
        /// ȡ�������ϴ��ļ����ļ���
        /// </summary>
        /// <param name="fileIndex">�ļ�����</param>
        /// <returns></returns>
        public string FileName(int fileIndex)
        {
            string fileName;
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            if (fileIndex < 0 || fileIndex >= files.Count)
            {
                files = null;
                return "";
            }
            System.Web.HttpPostedFile file = files[fileIndex];
            fileName = System.IO.Path.GetFileName(file.FileName);
            file = null;
            files = null;
            return fileName;
        }
        /// <summary>
        /// ��ʱ�������������ļ���
        /// </summary>
        /// <param name="fileIndex">�ļ�����</param>
        /// <returns></returns>
        public string TimeFileName(int fileIndex)
        {
            int RandNum;
            string fileName;
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            if (fileIndex < 0 || fileIndex >= files.Count)
            {
                files = null;
                return "";
            }
            System.Web.HttpPostedFile file = files[fileIndex];
            Random rnd = new Random();
            RandNum = rnd.Next(1, 99);//����һ��99���ڵ������
            fileName = DateTime.Now.ToString("yyyyMMddHHmmssffffff") + RandNum.ToString() + System.IO.Path.GetExtension(file.FileName);
            file = null;
            files = null;
            return fileName;
        }
        /// <summary>
        /// ��ʱ�������������ļ���
        /// </summary>
        /// <param name="FileExt">�ļ���׺��</param>
        /// <returns></returns>
        public string TimeFileName(string FileExt)
        {
            int RandNum;
            string PhotoName;
            Random rnd = new Random();
            RandNum = rnd.Next(1, 99);//����һ��99���ڵ������
            PhotoName = DateTime.Now.ToString("yyyyMMddHHmmssffffff") + RandNum.ToString() + FileExt;
            return PhotoName;
        }
        /// <summary>
        /// ���ص�ǰ���ڵ�����
        /// </summary>
        /// <returns></returns>
        public string DateDirectory()
        {
            string FolderName;
            FolderName = DateTime.Now.ToString("yyyyMMdd");
            return FolderName;
        }
        #endregion

        #region �ļ�������

        /// <summary>
        /// ����ļ���׺��
        /// </summary>
        /// <returns></returns>
        public bool CheckFileExt()
        {
            string tmpFileExt = _UploadFileExt;
            string[] strFileExt = tmpFileExt.Split(',');
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            //������ļ�
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile file = files[i];
                foreach (string FileExt in strFileExt)
                {
                    if (file.FileName != null && file.FileName != String.Empty)
                    {
                        if (FileExt.ToLower().Trim() == System.IO.Path.GetExtension(file.FileName).ToLower().Trim())
                        {
                            return true;
                        }
                    }
                }
            }
            files = null;
            return false;
        }
        /// <summary>
        /// ���������ļ���С
        /// </summary>
        /// <returns></returns>
        public bool CheckFileSize()
        {
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            //������ļ�
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile file = files[i];
                if (file.ContentLength > _UpFolderSize * 1024)
                {
                    return false;
                }
            }
            files = null;
            return true;
        }
        /// <summary>
        /// �ϴ����ļ���
        /// </summary>
        /// <returns></returns>
        public int FilesCount()
        {
            return System.Web.HttpContext.Current.Request.Files.Count;
        }
        /// <summary>
        /// ���Ǳ����ļ�
        /// </summary>
        /// <param name="fileIndex">�ļ���������</param>
        /// <param name="AbsoluteFileName">�ļ�����·�����ļ���</param>
        /// <returns>
        ///		0:�ϴ��ļ��ɹ�
        ///		1:�ϴ����ļ�����ָ����С
        ///		2:�ϴ����ļ���ʽ����ָ���ĺ�׺���б���
        ///		3:�ϴ����ļ�û�к�׺��
        ///		4:�����ļ�����
        ///		5:�ļ�������������
        ///</returns>
        public int Save(int fileIndex, string AbsoluteFileName)
        {
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            string tmpFileExt = _UploadFileExt;
            string[] strFileExt = tmpFileExt.Split(',');
            if (fileIndex < 0 || fileIndex >= files.Count)
            {
                files = null;
                return 5;
            }
            System.Web.HttpPostedFile file = files[fileIndex];
            //�ж��ļ���С
            if (file.ContentLength > _UpFolderSize * 1024)
            {
                return 1;
            }
            //�����׺��
            if (file.FileName != String.Empty)
            {
                if (IsStringExists(System.IO.Path.GetExtension(file.FileName).ToLower().Trim(), strFileExt) == false)
                    return 2;
            }
            else
            {
                return 3;
            }
            //�����ļ�
            try
            {
                //FileDelete(AbsoluteFileName);
                file.SaveAs(AbsoluteFileName);
            }
            catch
            {
                return 4;
            }
            return 0;
        }
        /// <summary>
        /// ���������ļ� ͬ���ļ��Զ�����
        /// </summary>
        /// <param name="AbsoluteFilePath">�ļ�����·��</param>
        /// <returns>
        ///		0:�ϴ��ļ��ɹ�
        ///		1:�ϴ����ļ�����ָ����С
        ///		2:�ϴ����ļ���ʽ����ָ���ĺ�׺���б���
        ///		3:�ϴ����ļ�û�к�׺��
        ///		4:�����ļ�����
        ///		5:û�з����ϴ����ļ�
        ///</returns>
        public int FilesSave(string AbsoluteFilePath)
        {
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            string tmpFileExt = _UploadFileExt;
            string[] strFileExt = tmpFileExt.Split(',');
            if (files.Count < 1)
            {
                files = null;
                return 5;//û�з����ϴ��ļ�;
            }
            //������ļ�
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile file = files[i];
                //�ж��ļ���С
                if (file.ContentLength > _UpFolderSize * 1024)
                {
                    return 1;
                }
                //�����׺��
                if (file.FileName != String.Empty)
                {
                    if (IsStringExists(System.IO.Path.GetExtension(file.FileName).ToLower().Trim(), strFileExt) == false)
                        return 2;
                    //�����ļ�
                    try
                    {
                        if (AbsoluteFilePath.LastIndexOf("\\") == AbsoluteFilePath.Length)
                        {
                            CreateDirectory(AbsoluteFilePath);
                            file.SaveAs(AbsoluteFilePath + System.IO.Path.GetFileName(file.FileName));
                        }
                        else
                        {
                            CreateDirectory(AbsoluteFilePath);
                            file.SaveAs(AbsoluteFilePath + "\\" + System.IO.Path.GetFileName(file.FileName));
                        }
                    }
                    //catch(Exception e1)
                    catch
                    {
                        //throw new Exception(AbsoluteFilePath + file.FileName);
                        return 4;
                    }
                }
            }
            files = null;
            return 0;
        }
        /// <summary>
        /// ���������ļ�
        /// </summary>
        /// <param name="AbsoluteFilePath">�ļ�����·��</param>
        /// <returns>
        ///		0:�ϴ��ļ��ɹ�
        ///		1:�ϴ����ļ�����ָ����С
        ///		2:�ϴ����ļ���ʽ����ָ���ĺ�׺���б���
        ///		3:�ϴ����ļ�û�к�׺��
        ///		4:�����ļ�����
        ///		5:û�з����ϴ����ļ�
        ///</returns>
        public int FilesNewNameSave(string AbsoluteFilePath)
        {
            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            string tmpFileExt = _UploadFileExt;
            string[] strFileExt = tmpFileExt.Split(',');
            if (files.Count < 1)
            {
                files = null;
                return 5;//û�з����ϴ��ļ�;
            }
            //������ļ�
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile file = files[i];
                //�ж��ļ���С
                if (file.ContentLength > _UpFolderSize * 1024)
                {
                    return 1;
                }
                //�����׺��,�޺�׺���Ĳ�������
                if (file.FileName != String.Empty)
                {
                    if (IsStringExists(System.IO.Path.GetExtension(file.FileName).ToLower().Trim(), strFileExt) == false)
                        return 2;
                    //�����ļ�
                    try
                    {
                        if (AbsoluteFilePath.LastIndexOf("\\") == AbsoluteFilePath.Length)
                        {
                            CreateDirectory(AbsoluteFilePath);
                            file.SaveAs(AbsoluteFilePath + TimeFileName(System.IO.Path.GetExtension(file.FileName)));
                        }
                        else
                        {
                            CreateDirectory(AbsoluteFilePath);
                            file.SaveAs(AbsoluteFilePath + "\\" + TimeFileName(System.IO.Path.GetExtension(file.FileName)));
                        }
                    }
                    //catch(Exception e1)
                    catch
                    {
                        //throw new Exception(e1.Source + e1.Message);
                        return 4;
                    }
                }
            }
            files = null;
            return 0;
        }       

        #endregion

        #region �ڲ�����
        /// <summary>
        /// ����ַ����Ƿ��������е�һ��
        /// </summary>
        /// <param name="inputData"></param>
        /// <param name="arrData"></param>
        /// <returns></returns>
        private static bool IsStringExists(string inputData, string[] arrData)
        {
            if (null == inputData || string.Empty == inputData)
            {
                return false;
            }
            foreach (string tmpStr in arrData)
            {
                if (inputData == tmpStr)
                {
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// ɾ���ļ�
        /// </summary>
        /// <param name="AbsoluteFilePath"></param>
        /// <returns></returns>
        private bool FileDelete(string AbsoluteFilePath)
        {
            try
            {
                FileInfo objFile = new FileInfo(AbsoluteFilePath);
                if (objFile.Exists)//�������
                {
                    //ɾ���ļ�.
                    objFile.Delete();
                    return true;
                }

            }
            catch
            {
                return false;
            }
            return false;
        }
        /// <summary>
        /// ����Ŀ¼
        /// </summary>
        /// <param name="DirectoryName">Ŀ¼��</param>
        /// <returns>��������,0:Ŀ¼�����ɹ�, 1:Ŀ¼�Ѵ���,2:Ŀ¼����ʧ��</returns>
        private int CreateDirectory(string DirectoryName)
        {
            try
            {
                if (!Directory.Exists(DirectoryName))
                {
                    Directory.CreateDirectory(DirectoryName);
                    return 0;
                }
                else
                {

                    return 1;
                }
            }
            catch
            {
                return 2;
            }
        }
        #endregion
    }
}
