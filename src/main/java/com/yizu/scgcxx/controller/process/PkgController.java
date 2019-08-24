package com.yizu.scgcxx.controller.process;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProductDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Product;
import com.yizu.scgcxx.model.Store;
import com.yizu.scgcxx.service.process.PkgService;
import com.yizu.scgcxx.util.LauiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/process")
public class PkgController {

    @Autowired
    private PkgService pkgService;

    @RequestMapping(value = "/pkg", method = RequestMethod.GET)
    public LauiData PkgDo(ProductDto productDto) {
        PageHelper.startPage(productDto.getPage(), productDto.getLimit());
        List<Product> list = pkgService.PkgDo();
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);
        return LauiData.SETDATA(0, "", new Long(pageInfo.getTotal()).intValue(), list, pageInfo);
    }

    @RequestMapping(value = "/pkg/{productResidue}", method = RequestMethod.POST)
    public ResultDto addPkg(Product product, @PathVariable BigDecimal productResidue) {
        pkgService.addPkg(product, productResidue);
        return ResultDto.succeedResult("打包成功");
    }
}
