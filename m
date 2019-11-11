Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FFDC43331
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 16:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2700C21783
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 16:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfKKQRd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 11:17:33 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:59012 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726857AbfKKQRd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 11:17:33 -0500
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xABGHHMZ019910
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Nov 2019 11:17:18 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id ABE194202FD; Mon, 11 Nov 2019 11:17:16 -0500 (EST)
Date:   Mon, 11 Nov 2019 11:17:16 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191111161716.GB7017@mit.edu>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
 <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
 <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
 <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
 <20191109043106.GC23325@mit.edu>
 <CACT4Y+a1NsFgaLYx4JQORLoyUs35PDwVt1f-PoiJYv-u8AZw1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+a1NsFgaLYx4JQORLoyUs35PDwVt1f-PoiJYv-u8AZw1g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 11, 2019 at 10:35:10AM +0100, Dmitry Vyukov wrote:
> 
> Regarding another mail agent: again this only proves the point for me:
> this is what tool developers are forced to be spending their resources
> on, rather then working on adding more useful features...
> I don't even know where to start re switching mail transport; how much
> the switch will cost? what are other transport costs in the long term
> maintenance? what are their problems?

This is a GMail bug/problem.  Your reply to me was sent without
format=flowed, so it's certainly possible that GMail not use
format=flowed.

There are plenty of open source mail transport agents where sending
this without format=flowed would be trivial....

					- Ted
