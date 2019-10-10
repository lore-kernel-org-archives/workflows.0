Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCE0C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 12:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC0DA208C3
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 12:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387472AbfJJMxD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 08:53:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387435AbfJJMxD (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 08:53:03 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 016E32067B;
        Thu, 10 Oct 2019 12:53:01 +0000 (UTC)
Date:   Thu, 10 Oct 2019 08:53:00 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Belouin <nicolas.belouin@gandi.net>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191010085300.7d84b499@gandalf.local.home>
In-Reply-To: <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
        <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
        <20191007211704.6b555bb1@oasis.local.home>
        <20191008164309.mddbouqmbqipx2sx@redhat.com>
        <20191008131730.4da4c9c5@gandalf.local.home>
        <20191008173902.jbkzrqrwg43szgyz@redhat.com>
        <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
        <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
        <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
        <20191009222156.nedvmajswb3w3r3c@dcvr>
        <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
        <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 10 Oct 2019 09:35:12 +0200
Nicolas Belouin <nicolas.belouin@gandi.net> wrote:

> Maybe the solution is to build such kind of features within git,
> many proposed solutions with tools over git or using git.
> A tool over git has the issue of conveying the data and making
> it non-centralized, whereas a tool using git is non-scalable because
> of the way git is *currently* storing things.
> Improving git to make it able to store many more objects (be it in-review
> commits or previous versions of patches) and then use it to get the kind
> of features we can envy from fossil.

To do this, we would have to make it where a user could pull just what
they want. The history of the code without the comments, or may choose
reviews etc. We don't want to bloat git too much that it becomes too
big just to compile the kernel.

-- Steve
