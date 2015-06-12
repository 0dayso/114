﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EyouSoft.Model.CompanyStructure;
namespace EyouSoft.IBLL.CompanyStructure
{
    /// <summary>
    /// 创建人：鲁功源  2010-05-27
    /// 描述：包含项目 业务逻辑接口
    /// </summary>
    public interface IServiceStandard
    {
        /// <summary>
        /// 添加一条包含项目
        /// </summary>
        /// <param name="model">包含项目实体</param>
        /// <returns>true: 操作成功 false: 操作失败</returns>
        [EyouSoft.AOPHandler.CommonLogHandler(
            LogTitle = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_ADD_TITLE,
            LogMessage = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_ADD, LogWriterType = typeof(EyouSoft.BusinessLogWriter.CompanyLog),
            EventCode = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_ADD_CODE
            )]
        bool Add(ServiceStandard model);
        /// <summary>
        /// 修改一条包含项目
        /// </summary>
        /// <param name="model">包含项目实体</param>
        /// <returns>true: 操作成功 false: 操作失败</returns>
        [EyouSoft.AOPHandler.CommonLogHandler(
            LogTitle = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_UPDATE_TITLE,
            LogMessage = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_UPDATE, LogWriterType = typeof(EyouSoft.BusinessLogWriter.CompanyLog),
            EventCode = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_UPDATE_CODE
            )]
        bool Update(ServiceStandard model);
        /// <summary>
        /// 真实删除
        /// </summary>
        /// <param name="id">主键ID</param>
        /// <returns>true: 操作成功 false: 操作失败</returns>
        [EyouSoft.AOPHandler.CommonLogHandler(
            LogTitle = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_DELETE_TITLE,
            LogMessage = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_DELETE, LogWriterType = typeof(EyouSoft.BusinessLogWriter.CompanyLog),
            EventCode = EyouSoft.BusinessLogWriter.CompanyLog.LOG_SERVICESTANDARD_DELETE_CODE
            )]
        bool Delete(int id);
        /// <summary>
        /// 根据公司ID获取包含项目列表
        /// </summary>
        /// <param name="companyId">公司编号</param>
        /// <param name="TypeID">包含项目类型</param>
        /// <param name="pageSize">每页显示条数</param>
        /// <param name="pageIndex">当前页码</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        IList<ServiceStandard> GetList(string companyId, EyouSoft.Model.CompanyStructure.ServiceTypes TypeID, int pageSize, int pageIndex, ref int recordCount);
        /// <summary>
        /// 获取一条包含项目实体
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        ServiceStandard GetModel(int id);
    }
}
