Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685E6C433F5
	for <workflows@archiver.kernel.org>; Thu, 29 Sep 2022 14:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbiI2OL1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 29 Sep 2022 10:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbiI2OLY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 29 Sep 2022 10:11:24 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5811684F2;
        Thu, 29 Sep 2022 07:11:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7E428CE21BF;
        Thu, 29 Sep 2022 14:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9E7C433C1;
        Thu, 29 Sep 2022 14:11:18 +0000 (UTC)
Date:   Thu, 29 Sep 2022 10:12:31 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929101231.58c052f1@gandalf.local.home>
In-Reply-To: <4f704d2f-12b5-8d6a-357e-d79b1e871ed7@leemhuis.info>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
        <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
        <20220929094753.6bba89d8@gandalf.local.home>
        <4f704d2f-12b5-8d6a-357e-d79b1e871ed7@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 29 Sep 2022 16:02:56 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> Ohh, yeah, sorry, should have mentioned this. Don't worry, I'm aware of
> this particular and a few similar products/components in bugzilla. I
> don't plan changing any of them, unless something unforeseen or a very
> good reason comes up (for example if they're obviously unused for years
> or something like that).

Well, years of not being used may not be a good indicator. I use bugzilla
as a dumping ground of my "todo lists". And I find sometimes it may take
years before I get to them ;-)

-- Steve
