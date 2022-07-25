<?php

namespace Database\Seeders;

use App\Models\SupportReasonNova;
use App\Models\WelcomeScreenNova;
use Illuminate\Database\Seeder;

class MainSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //$this->supportReason();
        $this->welcomeScreens();

    }

    public function supportReason()
    {
        foreach([
                    ['name_en' => 'Suggestion' , 'name_ar' => 'اقتراح' , 'status' => 1],
                    ['name_en' => 'Complaint' , 'name_ar' => 'شكوى' , 'status' => 1],
                    ['name_en' => 'Inquiry' , 'name_ar' => 'استفسار' , 'status' => 1],
                    ['name_en' => 'Cancel order' , 'name_ar' => 'إلغاء الطلب' , 'status' => 1],
                ] as $reason)
        {
            $support = new SupportReasonNova();
            foreach($reason as $key => $val)
            {
                $support->{$key} = $val;
            }
            $support->save();
        }
    }

    public function welcomeScreens()
    {
        foreach([
                    ['image' => '1647195240839390.jpg' , 'title_en' => 'Assumenda non nemo a' , 'description_en' => 'Labore sit quia quid' , 'title_ar' => 'Ratione provident p' , 'description_ar' => 'Consequatur volupta' , 'active' => 1 , 'position' => 1],
                    ['image' => '1647193373679582.jpg' , 'position' => 3 , 'title_en' => 'One-stop services platform' , 'description_en' => 'Mueeny connects clients with the service providers. Increase your profit and get your services done!' , 'title_ar' => 'منصة الخدمات المتكاملة' , 'description_ar' => 'معینی هي منصة تربط العملاء بمزودي الخدمة. زد أرباحك وأنجز خدماتك في الوقت ذاته!' , 'active' => 1],
                    ['image' => '1649067583669292.jpg' ,'position' => 4, 'title_en' => 'Registration' , 'description_en' => '1-  Verify your phone number
2- Determine your location
3- Complete the registration form
4- Start your journey with Mueeny!' , 'title_ar' => 'التسجيل في معيني' , 'description_ar' => '1- سيتم التحقق من رقم هاتفك
2- تحديد موقعك
3- إكمال استمارة التسجيل
4- ابدأ رحلتك مع معيني!' , 'active' => 1],
                    ['image' => '1647951610174968.jpg' , 'position' => 32 ,'title_en' => 'Get started!' , 'description_en' => 'Mueeny is the comprehensive platform for all your services.' , 'title_ar' => 'لنبدأ!' , 'description_ar' => 'معيني المنصة المتكاملة لخدماتك' , 'active' => 0],
                ] as $reason)
        {
            $support = new WelcomeScreenNova();
            foreach($reason as $key => $val)
            {
                $support->{$key} = $val;
            }
            $support->save();
        }
    }
}
