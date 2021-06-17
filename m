Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768E6C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45925614A7
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhFQP2H (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:28:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233202AbhFQP2G (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 11:28:06 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D2CC61437;
        Thu, 17 Jun 2021 15:25:58 +0000 (UTC)
Date:   Thu, 17 Jun 2021 11:25:56 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617112556.41fe8200@gandalf.local.home>
In-Reply-To: <20210617144741.jxachwj46ftzlgns@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
        <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
        <20210617144741.jxachwj46ftzlgns@nitro.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 17 Jun 2021 10:47:41 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> It's not specific to GH at all. The same bot will be able to perform similar
> actions to emails created by git-request-pull, e.g.:
> 
> - submitter runs git request-pull instead of git-format-patch
> - submitter sends the output to a dedicated mailing list like
>   pulls@lists.linux.dev
> - the bot auto-converts these requests into patch series and sends them to
>   proper destinations

I know many people that this will be useful for. Especially those that have
to send with their work email, and have to fight Exchange servers. And
gmail isn't very good at sending patches either.

Let me see if I understand the proposed work flow, and perhaps add some
myself.

1) Someone clones Linus's tree or some subsystem tree into their github
   account.

2) Does some work.

3) Pushes it to their account on github.

4) Runs git pull-request that will go to pulls@lists.kernel.dev

5) Then this bot can pull the request into a kernel.org tree.

6) Runs checkpatch on each commit.

   On errors, sends a report to the submitter, and stops here.

7) Could have the zero-day-bot run against it.

   On errors, send it back to the submitter.

8) If it passes all the above, it then gets broken into a patch series and
   then sent out to the mailing lists and Cc's maintainers based on the
   get_maintainers list. Probably should be filtered a bit.

Is this what is being proposed?

-- Steve
