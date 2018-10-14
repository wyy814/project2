package com.project2.controller;

import com.project2.entity.Adm;
import com.project2.service.AdmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("adm")
@Controller
public class AdmController {
    @Autowired
    private AdmService admService;

    /**
     * ����Ա���������Ƿ���ȷ
     * @param adm
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public String login(Adm adm){
        Adm adm1 = admService.queryAdm(adm);
        if (adm1!=null){
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * �û���¼
     * @return
     */
    @RequestMapping("login2")
    public String login2(){
        return "adm/base";
    }
}