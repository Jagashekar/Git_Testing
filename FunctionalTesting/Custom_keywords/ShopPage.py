

from robot.api.deco import library, keyword

from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self,):
        self.seLib = BuiltIn().get_library_instance('SeleniumLibrary')


    @keyword
    def add_items_to_cart_and_checkout(self, productlist):
        i=1
        products_titles = self.seLib.get("css:.card-title")
        for products_title in products_titles:
            if products_title.text in productlist:
                self.seLib.click_button("xpath://*[@class='card-footer'])["+str(i)+"/button")

        i=i+1



