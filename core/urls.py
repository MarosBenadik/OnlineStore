import debug_toolbar
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("django/admin/", admin.site.urls),
    path("django/", include("store.urls", namespace="store")),
    path("django/checkout/", include("checkout.urls", namespace="checkout")),
    path("django/basket/", include("basket.urls", namespace="basket")),
    path("django/account/", include("account.urls", namespace="account")),
    path("django/orders/", include("orders.urls", namespace="orders")),
    path("django/__debug__/", include(debug_toolbar.urls)),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
