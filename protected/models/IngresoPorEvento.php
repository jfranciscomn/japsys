<?php

/**
 * This is the model class for table "IngresoPorEvento".
 *
 * The followings are the available columns in table 'IngresoPorEvento':
 * @property integer $id
 * @property double $colectas
 * @property double $eventos
 * @property double $rifas
 * @property double $desayunos
 * @property double $conferencias
 * @property integer $institucion_id
 * @property integer $ejercicio_id
 * @property integer $estatus_id
 * @property integer $editable
 * @property string $ultimaModificacion
 */
class IngresoPorEvento extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return IngresoPorEvento the static model class
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
		return 'IngresoPorEvento';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('colectas, eventos, rifas, desayunos, conferencias, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'required'),
			array('institucion_id, ejercicio_id, estatus_id, editable', 'numerical', 'integerOnly'=>true),
			array('colectas, eventos, rifas, desayunos, conferencias', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, colectas, eventos, rifas, desayunos, conferencias, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'colectas' => 'Colectas',
			'eventos' => 'Eventos',
			'rifas' => 'Rifas',
			'desayunos' => 'Desayunos',
			'conferencias' => 'Conferencias',
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
		$criteria->compare('colectas',$this->colectas);
		$criteria->compare('eventos',$this->eventos);
		$criteria->compare('rifas',$this->rifas);
		$criteria->compare('desayunos',$this->desayunos);
		$criteria->compare('conferencias',$this->conferencias);
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