# Linux ypserv Makefile autofs fixes

### Add maps to definitions 
```Makefile
AUTO_MAPS = auto.master auto.misc
```


### replace all autofs rules with
```Makefile
autofs: $(AUTO_MAPS)

$(AUTO_MAPS): %: $(YPSRCDIR)/%
  @echo "Updating $@..."
  -@sed -e "/^#/d" -e s/#.*$$// "$<" | $(DBLOAD) \
    -i "$<" -o $(YPMAPDIR)/$@ - $@
  -@$(NOPUSH) || $(YPPUSH) -d $(DOMAIN) $@
```  
