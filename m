Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E81C47404
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 00:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24162206C0
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 00:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbfJJAHU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 20:07:20 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:42744 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730815AbfJJAHU (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 9 Oct 2019 20:07:20 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 2C9A51F4BD;
        Thu, 10 Oct 2019 00:07:20 +0000 (UTC)
Date:   Thu, 10 Oct 2019 00:07:20 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Laura Abbott <labbott@redhat.com>, Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191010000719.whfuq4xrah3aec7v@dcvr>
References: <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr>
 <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
> > One of my long-term visions is to have an agreed upon way to
> > have entirely forkable development communities.  Git already
> > gave us forkable code repositories.
> 
> FYI, this does already exist in the form of Fossil:
> https://www.fossil-scm.org/home/doc/trunk/www/index.wiki

Not quite, they still have active sqlite-dev and sqlite-users
mailing lists and I don't think they intend to replace/augment
them with Fossil.
