require 'mechanize'

agent = WWW::Mechanize.new

agent.get("http://www.baxterautoparts.com/Catalog/QuickCatalog.aspx")

