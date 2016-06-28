import './Lesson.sol';
import '../dao/Core.sol';
import '../token/TokenEmission.sol';

contract SecondLesson is Lesson {
    
	address public airalab_learning_center;
	
	function SecondLesson(address _ownerAir, address _airalab_learning_center) 
		     Lesson(_ownerAir) {
		airalab_learning_center = _airalab_learning_center;
    }
	
    function execute(address _dao) {
		// проверяем что дан approve 1 акции
		TokenEmission shares = TokenEmission(Core(_dao).getModule('shares'));
		if (shares.allowance(msg.sender, airalab_learning_center) == 1) {			
			ownerAir.deal(msg.sender, 100);
		}
    }
}