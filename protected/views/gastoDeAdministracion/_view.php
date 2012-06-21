	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->sueldos); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->honorarios); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->combustibles); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->luzTelefono); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->papeleria); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->impuestosDerechos); ?>
		</td>
		<?php /*
		<td>
			<?php echo CHtml::encode($data->otros); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->institucion_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ejercicio_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->editable); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ultimaModificacion); ?>
		</td>
		*/ ?>
	</tr>