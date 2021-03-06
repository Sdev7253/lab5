<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Comment'), ['action' => 'edit', $comment->commentID]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Comment'), ['action' => 'delete', $comment->commentID], ['confirm' => __('Are you sure you want to delete # {0}?', $comment->commentID)]) ?> </li>
        <li><?= $this->Html->link(__('List Comments'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Comment'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="comments view large-9 medium-8 columns content">
    <h3><?= h($comment->commentID) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('CommentID') ?></th>
            <td><?= $this->Number->format($comment->commentID) ?></td>
        </tr>
        <tr>
            <th><?= __('UserID') ?></th>
            <td><?= $this->Number->format($comment->userID) ?></td>
        </tr>
        <tr>
            <th><?= __('ArticleID') ?></th>
            <td><?= $this->Number->format($comment->articleID) ?></td>
        </tr>
        <tr>
            <th><?= __('Created') ?></th>
            <td><?= h($comment->created) ?></tr>
        </tr>
        <tr>
            <th><?= __('Modified') ?></th>
            <td><?= h($comment->modified) ?></tr>
        </tr>
        <tr>
            <th><?= __('Approved') ?></th>
            <td><?= $comment->approved ? __('Yes') : __('No'); ?></td>
         </tr>
    </table>
    <div class="row">
        <h4><?= __('Body') ?></h4>
        <?= $this->Text->autoParagraph(h($comment->body)); ?>
    </div>
</div>
