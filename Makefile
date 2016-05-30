AUTO_MAPS = auto.master auto.misc

..
..
..

# rules 
autofs: $(AUTO_MAPS)

$(AUTO_MAPS): %: $(YPSRCDIR)/%
  @echo "Updating $@..."
  -@sed -e "/^#/d" -e s/#.*$$// "$<" | $(DBLOAD) \
    -i "$<" -o $(YPMAPDIR)/$@ - $@
  -@$(NOPUSH) || $(YPPUSH) -d $(DOMAIN) $@
