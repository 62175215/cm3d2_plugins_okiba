## �g���Z�[�u�f�[�^�ɒǉ������f�[�^

�g���Z�[�u�f�[�^���� `/savedata/maids/maid/plugins/plugin[@name = "CM3D2.MaidVoicePitch"]/prop` �ɕۑ�����܂��B
�^�O�̍\���͈ȉ��̂悤�ɂȂ�܂�

```
<savedata target="...">
  <maids>
    <maid guid="..." lastname="..." firstname="..." createtime="...">
      <plugins>
        <plugin name="CM3D2.MaidVoicePitch">
          <prop name="���O���̂P" value="�l���̂P" />
          <prop name="���O���̂Q" value="�l���̂Q" />
          ...
        </plugin>
```

�u���O�v�Ɓu�l�v�̈ꗗ�͈ȉ��̒ʂ�ł�

 - �uXML�t�@�C�����v�́A"test.xml" ���w�肵���ꍇ "C:\KISS\CM3D2_KAIZOU\test.xml" ��ǂݍ��݂܂�

| ���O                    | �l            | ����l | �T�v |
| ------                  | ------        | ------ | ---- |
| PITCH                   | -1.0�`1.0     | 0      | ���̃s�b�`��ύX�B+0.05�Ȃ�5%�����A-0.16�Ȃ�16%�x���Đ� |
| SLIDER_TEMPLATE         | XML�t�@�C���� |�i�Ȃ��j| �G�f�B�b�g��ʂ̃X���C�_�[�̌��E�l�ݒ�t�@�C�����w�� |
| FACE_SCRIPT_TEMPLATE    | XML�t�@�C���� |�i�Ȃ��j| �X�N���v�g����@Face��@FaceBlend�ɂ��\��w���u��������t�@�C�����w�� |
| PROPSET_OFF             | True/False    | False  | True�Ȃ�A�X�N���v�g����@PropSet�ɂ���⌨�X���C�_�[�̕␳��}�� |
| FACE_OFF                | True/False    | False  | True�Ȃ�A�X�N���v�g����@Face�ɂ��\��ω���}�� |
| FACEBLEND_OFF           | True/False    | False  | True�Ȃ�A�X�N���v�g����@FaceBlend�ɂ��j�Ɨ܂̕\��ω���}�� |
| EYETOCAMERA_OFF         | True/False    | False  | True�Ȃ�A�X�N���v�g����@EyeToCamera�ɂ�鎋���w���}�� |
| MUHYOU                  | True/False    | False  | True�Ȃ�A�S�Ă̕\��ω���}�� |
| HYOUJOU_OFF             | True/False    | False  | True�Ȃ�A�ڂƌ��̕\��ω���}�� |
| LIPSYNC_OFF             | True/False    | False  | True�Ȃ�A���b�v�V���N(���p�N)��}�� |
| LIPSYNC_INTENISTY       | True/False    | False  | True�Ȃ�A���b�v�V���N(���p�N)���x�ݒ���s�� |
| LIPSYNC_INTENISTY.value | 0.0�`1.0      | 1      | ���b�v�V���N(���p�N)���x�B1.0�ōő�A0.0�ōŏ� |
| EYETOCAM                | -1,0,1        | 0      | ������������B1:��ɃJ�����������A-1:��ɃJ�����������Ȃ��A0:�X�N���v�g�ɏ]�� |
| HEADTOCAM               | -1,0,1        | 0      | ���������B1:��ɃJ�����������A-1:��ɃJ�����������Ȃ��A0:�X�N���v�g�ɏ]�� |
| MABATAKI                | 0.0�`1.0      | 1      | �ڂ̊J�x�B1.0�ōő�(�ڂ��J��)�A0.0�ōŏ�(�ڂ����) |
| EYEBALL.width           | 0.0�`5.0      | 1      | ���̕��B1.0�Œʏ�A0.0�ōŏ� |
| EYEBALL.height          | 0.0�`5.0      | 1      | ���̍����B1.0�Œʏ�A0.0�ōŏ� |
| FARMFIX                 | True/False    | False  | True�Ȃ�A�O�r�␳�������s���A�O�r���ׂ��Ȃ�̂�}������ |
| WIDESLIDER              | True/False    | False  | True�Ȃ�A�g���X���C�_�[�������s���A�X���C�_�[�̌��E�l��傫������ |
| EYE_ANG.angle           | -60.0�`+60.0  | 0      | �ڂ̊p�x |
| EYE_ANG.x               | -999�`+999    | 0      | �ڂ̉�]���S�ʒu�̕␳�l(1) |
| EYE_ANG.y               | -999�`+999    | 0      | �V (2) |
| THISCL.depth            | 0.1�`5.0      | 1      | ���S�̂̃X�P�[�����O(���s��) |
| THISCL.width            | 0.1�`5.0      | 1      | �V (��) |
| THIPOS.x                | -999�`+999    | 0      | ���̈ʒu (���E) |
| THIPOS.z                | -999�`+999    | 0      | �V  (�O��) |
| PELSCL.height           | 0.1�`5.0      | 1      | ���ՃX�P�[�����O (����) |
| PELSCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| PELSCL.width            | 0.1�`5.0      | 1      | �V (��) |
| SKTSCL.height           | 0.1�`5.0      | 1      | �X�J�[�g���ӃX�P�[�����O (����) |
| SKTSCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| SKTSCL.width            | 0.1�`5.0      | 1      | �V (��) |
| SPISCL.height           | 0.1�`5.0      | 1      | ��(������)�X�P�[�����O (����) |
| SPISCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| SPISCL.width            | 0.1�`5.0      | 1      | �V (��) |
| S0ASCL.height           | 0.1�`5.0      | 1      | ��(����)�X�P�[�����O (����) |
| S0ASCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| S0ASCL.width            | 0.1�`5.0      | 1      | �V (��) |
| S1_SCL.height           | 0.1�`5.0      | 1      | ��(�݂�����)�X�P�[�����O (����) |
| S1_SCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| S1_SCL.width            | 0.1�`5.0      | 1      | �V (��) |
| S1ASCL.height           | 0.1�`5.0      | 1      | ��(�]��)�X�P�[�����O (����) |
| S1ASCL.depth            | 0.1�`5.0      | 1      | �V (���s��) |
| S1ASCL.width            | 0.1�`5.0      | 1      | �V (��) |
| HEAD_TRACK              | True/False    | False  | ��Ɩڂ̒Ǐ]����̉��P |
| HEAD_TRACK.lateral      |  0.0�`90.0    | 30     | ��̉��������p�x |
| HEAD_TRACK.above        |-90.0�`90.0    | 30     | �V������V |
| HEAD_TRACK.below        |-90.0�`90.0    | 15     | �V�������V |
| HEAD_TRACK.behind       |  0.0�`180.0   | 90     | �炪�Ǐ]��������߂�p�x |
| HEAD_TRACK.speed        |  0.0�`1.0     |  0.04  | ��̉�]���x |
| HEAD_TRACK.ofsx         |-90.0�`90.0    |  0     | ����]�I�t�Z�b�g (���ŉE�A���ō�������) |
| HEAD_TRACK.ofsy         |-90.0�`90.0    |  0     | �c��]�I�t�Z�b�g (���ŉ��A���ŏ������) |
| HEAD_TRACK.ofsz         |-90.0�`90.0    |  0     | ��]�I�t�Z�b�g (���ŉE�A���ō��ɂ�������) |
| EYE_TRACK.inside        |  0.0�`90.0    | 35     | �ڂ̓������p�x |
| EYE_TRACK.outside       |  0.0�`90.0    | 65     | �V�O���V |
| EYE_TRACK.above         |-90.0�`90.0    | 10     | �V������V |
| EYE_TRACK.below         |-90.0�`90.0    | 20     | �V�������V |
| EYE_TRACK.behind        |  0.0�`180.0   | 90     | �ڂ��Ǐ]��������߂�p�x |
| EYE_TRACK.speed         |  0.0�`1.0     |  0.07  | �ڂ̉�]���x |
| EYE_TRACK.ofsx          |-90.0�`90.0    |  0     | ���I�t�Z�b�g (���Ŋ��ځA���ŗ����) |
| EYE_TRACK.ofsy          |-90.0�`90.0    |  0     | �c�I�t�Z�b�g (���ŉ��A���ŏ�) |
