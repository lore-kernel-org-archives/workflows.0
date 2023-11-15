Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9EFC2BB3F
	for <workflows@archiver.kernel.org>; Wed, 15 Nov 2023 21:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjKOVmo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Nov 2023 16:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjKOVmn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Nov 2023 16:42:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC40130
        for <workflows@vger.kernel.org>; Wed, 15 Nov 2023 13:42:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E974FC433C7;
        Wed, 15 Nov 2023 21:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1700084560;
        bh=xgo5SMjYzd02tOg5s7lPX08q94qLs1A+dzJbh6h6bx0=;
        h=Date:From:To:Subject:From;
        b=fT/UwQVPgQKgizv/nXpAEjYwB7WXaGqAaFJPWarjVHBFT/+b1oLqjK19brU0lbAra
         dx/MGctLdwj4n9rJt8j2gwaqPYp6Jk063JWaJ0rAtZYBi1CvP55BGOC1sUg5eTvMRk
         z48UyZhx32Nlsh4N4fLbKkeuNeMJWu3tmljGH03g=
Date:   Wed, 15 Nov 2023 16:42:38 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: So, you want to read LKML with Gmail (experimental, testers needed)
Message-ID: <20231115-black-partridge-of-growth-54bf2e@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello:

LKML does not work well with Gmail, for the following reasons:

1. the amount of mail is very large
2. the bursty nature of patchbombs often overwhelms Gmail's quota of
   "maximum 60 messages per minute"

We are trialing out another mechanism of delivering mail into Gmail, via its
POP3 integration. I've been running it for the past few weeks and it has
proven reliable enough to invite more testers.

Important caveats:

1. This is entirely EXPERIMENTAL on our end; this service may go away if we
   discover important stability, scalability, etc kinds of problems
2. Gmail's POP3 support can go away as part of its regular killing of useful
   features in their products
3. There are still Gmail limits you may hit with this mechanism, known and
   unknown, so be careful not to miss important mail

That said, if you're willing to test it out, here's how you can go about it.
These instructions are for gmail.com, but similar instructions can be used for
Google Workspace setups.

1. In Gmail, go to Gear->"See all settings"
2. Choose the "Accounts and Import" tab
3. Scroll down to "Check mail from other accounts" -> "Add a mail account"
4. This pops up a new window
5. Email can be anything, but I suggest "lkml@lore.kernel.org"
6. The only option next is "Import emails from my other account (POP3)"
7. Run "uuidgen" in the terminal or visit https://www.uuidgenerator.net/,
   which is what we'll use to identify you
8. VERY IMPORTANT: your "username" is:

   unique-uuidgen-string@org.kernel.vger.linux-kernel?initial_limit=20

   !!! Do not omit "?initial_limit=20" unless you like tens of thousands of
   new messages in your inbox !!!

   Password: anonymous
   POP Server: pop.lore.kernel.org
   Port: 110 (995/SSL will work, too, but is of little benefit here)
   Leave a copy: leave unchecked
   Always use a secure connection: leave unchecked if you used port 110
   Label incoming messages: up to you entirely
   Skip the Inbox: up to you entirely

9. Press "Add account"
10. Pick "No (you can change this later)", because this part is irrelevant

That should be all that's needed. Assuming you didn't forget
?initial_import=20, you should see these messages in your inbox very shortly.
Gmail will fetch new messages every few minutes, and you can also trigger a
manual check by clicking the round-arrow "Refresh" button.

Of course, you are welcome to pick a different list to follow instead of
"linux-kernel" or follow several lists if you like, but keep in mind that you
can't have more than 5 POP3 accounts configured in gmail. All you have to do
is change the "username" to reflect the reversed list-id ("newsgroup name") of
the list you want to subscribe to.

Please test it out and provide any feedback you have if something isn't
working. The goal is to have this tested and make it available for
search-based inboxes that are coming in the near future.

-K
