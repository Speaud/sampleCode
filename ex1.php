<?php
namespace Controllers;

use	\Core\View,
	\Helpers\Session,
	\Helpers\Password,
	\Helpers\Url;
	
class Register extends \Core\Controller
{
	
	private $_model;

    public function __construct()
    {
        parent::__construct();
		$this->_model = new \Models\Register();
        $this->language->load('Welcome');
		
    }

    public function index()
    {
	
		if (isset($_POST['register'])) {
			
			$un = $_POST['un'];
			$email = $_POST['email'];

			// format birthday to age
			function convertBirthday(&$birthYear)
			{
				
				$birthYear = $_POST['age_year'];
				$currentYear = date('Y');
				$toAge = $currentYear - $birthYear;
				return $toAge;
				
			}
		
			$age = convertBirthday($birthYear);

			// format data for db entry
			$data = array (
			
				'country' => $_POST['country'],
				'saf' => $_POST['saf'],
				'fname' => $_POST['fname'],
				'lname' => $_POST['lname'],
				'birthday' => $_POST['age_year'].'/'.$_POST['age_month'].'/'.$_POST['age_day'],
				'age' => $age,
				'email' => $_POST['email'],
				'un' => $_POST['un'],
				'pw' => Password::make($_POST['pw']), //todo-- activation via email? people may not immediately check...?
				'account_type' => $_POST['account_type']
				
			);
			
			// secondary validation if jqv fail
				$verify = array ( // a
					chkUn => array ( // b
						$un => 'Username in use' // c => d
					),
					chkEmail => array ( // b
						$email => 'email in use'  // c => d
					)
				);
				
				foreach ($verify as $a => $b) {
					foreach ($b as $c => $d) {
						if ($this->_model->$a($c) == true) {
							$error[] = $d;
						}
					}
				}

        $data['title'] = 'register home';
        $data['welcome_message'] = $this->language->get('welcome_message');

        View::renderTemplate('guest-header', $data);
        View::render('register/register', $data, $error);
        View::renderTemplate('footer', $data);
		
    }
}
