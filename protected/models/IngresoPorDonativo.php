<?php

/**
 * This is the model class for table "IngresoPorDonativo".
 *
 * The followings are the available columns in table 'IngresoPorDonativo':
 * @property integer $id
 * @property double $personaFisica
 * @property double $personaMoral
 * @property double $fundacionesNacionales
 * @property double $fundacionesExtrajeras
 * @property double $fondosGubernamentales
 * @property double $especie
 * @property integer $institucion_id
 * @property integer $ejercicio_id
 * @property integer $estatus_id
 * @property integer $editable
 * @property string $ultimaModificacion
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 * @property Institucion $institucion
 * @property EjercicioFiscal $ejercicio
 */
class IngresoPorDonativo extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return IngresoPorDonativo the static model class
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
		return 'IngresoPorDonativo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('personaFisica, personaMoral, fundacionesNacionales, fundacionesExtrajeras, fondosGubernamentales, especie, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'required'),
			array('institucion_id, ejercicio_id, estatus_id, editable', 'numerical', 'integerOnly'=>true),
			array('personaFisica, personaMoral, fundacionesNacionales, fundacionesExtrajeras, fondosGubernamentales, especie', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, personaFisica, personaMoral, fundacionesNacionales, fundacionesExtrajeras, fondosGubernamentales, especie, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'safe', 'on'=>'search'),
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
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_id'),
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_id'),
			'ejercicio' => array(self::BELONGS_TO, 'EjercicioFiscal', 'ejercicio_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'personaFisica' => 'Persona Fisica',
			'personaMoral' => 'Persona Moral',
			'fundacionesNacionales' => 'Fundaciones Nacionales',
			'fundacionesExtrajeras' => 'Fundaciones Extrajeras',
			'fondosGubernamentales' => 'Fondos Gubernamentales',
			'especie' => 'Especie',
			'institucion_id' => 'Institucion',
			'ejercicio_id' => 'Ejercicio',
			'estatus_id' => 'Estatus',
			'editable' => 'Editable',
			'ultimaModificacion' => 'Ultima Modificacion',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('personaFisica',$this->personaFisica);
		$criteria->compare('personaMoral',$this->personaMoral);
		$criteria->compare('fundacionesNacionales',$this->fundacionesNacionales);
		$criteria->compare('fundacionesExtrajeras',$this->fundacionesExtrajeras);
		$criteria->compare('fondosGubernamentales',$this->fondosGubernamentales);
		$criteria->compare('especie',$this->especie);
		$criteria->compare('institucion_id',$this->institucion_id);
		$criteria->compare('ejercicio_id',$this->ejercicio_id);
		$criteria->compare('estatus_id',$this->estatus_id);
		$criteria->compare('editable',$this->editable);
		$criteria->compare('ultimaModificacion',$this->ultimaModificacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}