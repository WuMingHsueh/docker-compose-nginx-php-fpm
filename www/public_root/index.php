<?php
$header = ["name", "number", "height", "skill"];
$data = [
    ["iverson", "3", "186", "cross over"],
    ["kobe", "24", "206", "fadeway shot"],
    ["curry", "38", "198", "logo shot"]
];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>php index</title>
</head>
<body>
    <table border="1">
        <thead>
            <tr>
                <?php foreach ($header as $headerData): ?>
                    <th>
                        <?= $headerData;?>
                    </th>
                <?php endforeach;?>
            </tr>
            <?php foreach ($data as $rowData): ?>
                <tr>
                    <?php foreach ($rowData as $value):?>
                        <td>
                            <?= $value?>
                        </td>
                    <?php endforeach;?>
                </tr>
            <?php endforeach;?>
        </thead>
    </table>
</body>
</html>