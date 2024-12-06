package com.india.billingservice;

import com.india.billingservice.wrapper.InvoiceDetailWrapper;
import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@Service
public class InvoiceGenerator {

    @Autowired
    private SpringTemplateEngine templateEngine;

    public File generatePdf(InvoiceDetailWrapper invoiceDetailWrapper) throws IOException, DocumentException {
        Context context = getContext(invoiceDetailWrapper);
        String html = loadAndFillTemplate(context);
        return renderPdf(html);
    }

    private File renderPdf(String html) throws IOException, DocumentException {
        File pathFile = new File("/Users/rishabh.verma/Documents/");
        File file = File.createTempFile("invoice", ".pdf", pathFile);
        OutputStream outputStream = new FileOutputStream(file);
        ITextRenderer renderer = new ITextRenderer(20f * 4f / 3f, 20);
        renderer.setDocumentFromString(html);
        renderer.layout();
        renderer.createPDF(outputStream);
        outputStream.close();
        file.deleteOnExit();
        return file;
    }

    private Context getContext(InvoiceDetailWrapper invoiceDetailWrapper) {
        Context context = new Context();
        context.setVariable("invoice", invoiceDetailWrapper);
        return context;
    }

    private String loadAndFillTemplate(Context context) {
        return templateEngine.process("NewInvoice", context);
    }
}
