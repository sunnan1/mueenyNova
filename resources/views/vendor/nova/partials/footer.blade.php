<p class="mt-8 text-center text-xs text-80">
    {{-- <a href="https://nova.laravel.com" class="text-primary dim no-underline">Laravel Nova</a> --}}
    <span class="px-1">&middot;</span>
    &copy; {{ date('Y') }} Mueeny
    <span class="px-1 text-danger">&#10084; &#65039;</span>
    v{{ \Laravel\Nova\Nova::version() }}
    I{{ \Request::ip(); }}

</p>
{{-- <nova-dark-theme-toggle></nova-dark-theme-toggle> --}}
<nova-dark-theme-toggle label="{{ __('Dark Theme') }}"></nova-dark-theme-toggle>
