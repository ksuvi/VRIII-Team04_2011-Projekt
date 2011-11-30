// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.group04_2011.web;

import ee.itcollege.group04_2011.entities.Vaeosa;
import ee.itcollege.group04_2011.entities.VaeosaAlluvus;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VaeosaAlluvusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VaeosaAlluvusController.create(@Valid VaeosaAlluvus vaeosaAlluvus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vaeosaAlluvus", vaeosaAlluvus);
            return "vaeosaalluvuses/create";
        }
        uiModel.asMap().clear();
        vaeosaAlluvus.persist();
        return "redirect:/vaeosaalluvuses/" + encodeUrlPathSegment(vaeosaAlluvus.getVaeosaAlluvusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VaeosaAlluvusController.createForm(Model uiModel) {
        uiModel.addAttribute("vaeosaAlluvus", new VaeosaAlluvus());
        return "vaeosaalluvuses/create";
    }
    
    @RequestMapping(value = "/{vaeosaAlluvusId}", method = RequestMethod.GET)
    public String VaeosaAlluvusController.show(@PathVariable("vaeosaAlluvusId") Long vaeosaAlluvusId, Model uiModel) {
        uiModel.addAttribute("vaeosaalluvus", VaeosaAlluvus.findVaeosaAlluvus(vaeosaAlluvusId));
        uiModel.addAttribute("itemId", vaeosaAlluvusId);
        return "vaeosaalluvuses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VaeosaAlluvusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vaeosaalluvuses", VaeosaAlluvus.findVaeosaAlluvusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) VaeosaAlluvus.countVaeosaAlluvuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vaeosaalluvuses", VaeosaAlluvus.findAllVaeosaAlluvuses());
        }
        return "vaeosaalluvuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VaeosaAlluvusController.update(@Valid VaeosaAlluvus vaeosaAlluvus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vaeosaAlluvus", vaeosaAlluvus);
            return "vaeosaalluvuses/update";
        }
        uiModel.asMap().clear();
        vaeosaAlluvus.merge();
        return "redirect:/vaeosaalluvuses/" + encodeUrlPathSegment(vaeosaAlluvus.getVaeosaAlluvusId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{vaeosaAlluvusId}", params = "form", method = RequestMethod.GET)
    public String VaeosaAlluvusController.updateForm(@PathVariable("vaeosaAlluvusId") Long vaeosaAlluvusId, Model uiModel) {
        uiModel.addAttribute("vaeosaAlluvus", VaeosaAlluvus.findVaeosaAlluvus(vaeosaAlluvusId));
        return "vaeosaalluvuses/update";
    }
    
    @RequestMapping(value = "/{vaeosaAlluvusId}", method = RequestMethod.DELETE)
    public String VaeosaAlluvusController.delete(@PathVariable("vaeosaAlluvusId") Long vaeosaAlluvusId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VaeosaAlluvus.findVaeosaAlluvus(vaeosaAlluvusId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vaeosaalluvuses";
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> VaeosaAlluvusController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    @ModelAttribute("vaeosaalluvuses")
    public Collection<VaeosaAlluvus> VaeosaAlluvusController.populateVaeosaAlluvuses() {
        return VaeosaAlluvus.findAllVaeosaAlluvuses();
    }
    
    String VaeosaAlluvusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
