Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E41ECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2C1920872
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388181AbfJOQhv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:37:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:51188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388189AbfJOQhu (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 12:37:50 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A96E20873;
        Tue, 15 Oct 2019 16:35:44 +0000 (UTC)
Date:   Tue, 15 Oct 2019 12:35:42 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Han-Wen Nienhuys <hanwen@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015123542.4443a065@gandalf.local.home>
In-Reply-To: <20191015160712.GD1003139@kroah.com>
References: <20191007211704.6b555bb1@oasis.local.home>
        <20191008164309.mddbouqmbqipx2sx@redhat.com>
        <20191008131730.4da4c9c5@gandalf.local.home>
        <20191008173902.jbkzrqrwg43szgyz@redhat.com>
        <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
        <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
        <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
        <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
        <20191010205733.GA16225@mit.edu>
        <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
        <20191015160712.GD1003139@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 15 Oct 2019 18:07:12 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> 	- patch series are a pain to apply, I have to manually open each
> 	  patch, give it a +2 and then when all of them are reviewed and
> 	  past testing, then they will be merged.  Is a pain.  Does no
> 	  one else accept patch series of 10-30 patches at a time other
> 	  than me?  How do they do it without opening 30+ tabs?

Just a note. When I do get +10 patch series, I do apply them one at a
time. I review each patch, and apply them as they stand on their own.
Of course if there's an issue with one of the patches, I just archive
the branch, and tell the submitter to submit another version. This is
also how I can test to see if things changed from patches I've already
reviewed, because I'll just apply the new ones and compare.

Hmm, I still do it one at a time, but in this case, I guess you have a
point ;-) It would be nice on a second review to say "I already looked
at 1-8 of a 20 patch series, let me just apply 1-8 and compare it with
what I already reviewed".

-- Steve
