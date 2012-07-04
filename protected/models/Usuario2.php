<?php

/**
 * This is the model class for table "Usuario".
 *
 * The followings are the available columns in table 'Usuario':
 * @property integer $id
 * @property string $usuario
 * @property string $password
 * @property integer $tipousuario_id
 * @property integer $institucion_id
 * @property integer $estatus
 *
 * The followings are the available model relations:
 * @property Estatus $estatus0
 */
class Usuario extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Usuario the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Usuario';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			
			array('usuario, password, tipousuario_id, estatus', 'required'),
			array('usuario','unique'),
			array('tipousuario_id, institucion_id, estatus', 'numerical', 'integerOnly'=>true),
			array('usuario', 'length', 'max'=>45),
			array('password', 'length', 'max'=>150),
			
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, usuario, password, tipousuario_id, institucion_id, estatus', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'estatus0' => array(self::BELONGS_TO, 'Estatus', 'estatus'),
			'tipousuario' => array(self::BELONGS_TO, 'TipoUsuario', 'tipousuario_id'),
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'usuario' => 'Usuario',
			'password' => 'Password',
			'tipousuario_id' => 'Tipousuario',
			'institucion_id' => 'Institucion',
			'estatus' => 'Estatus',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	
	public function getSuperUsers()
	{
		$criteria = new CDbCriteria;
		
		$tipoUsuario= TipoUsuario::model()->find('nombre=:nombre', array(':nombre'=>'Administracion'));
		//$criteria->select='usuario';
		$criteria->compare('tipousuario_id',$tipoUsuario->id);
		
		$superusers = $this->findAll($criteria);
		$susers = array();
		foreach($superusers as $suser){
			$susers[] = $suser->usuario;
		}
		return $susers;
	}
	
	public function findByUserName($usuario)
	{
		return $this->find('usuario=:usuario', array(':usuario'=>$usuario));
	}
	
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('usuario',$this->usuario,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('tipousuario_id',$this->tipousuario_id);
		$criteria->compare('institucion_id',$this->institucion_id);
		$criteria->compare('estatus',$this->estatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	

}