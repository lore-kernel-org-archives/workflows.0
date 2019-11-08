Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCADDC5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D06B2178F
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfKHODF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:03:05 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:34134 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726281AbfKHODF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:03:05 -0500
Received: from callcc.thunk.org (96-72-84-49-static.hfc.comcastbusiness.net [96.72.84.49] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA8E2oRM015321
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 8 Nov 2019 09:02:51 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 9BA664202FD; Fri,  8 Nov 2019 09:02:49 -0500 (EST)
Date:   Fri, 8 Nov 2019 09:02:49 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191108140249.GA23325@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 10:44:25AM +0100, Dmitry Vyukov wrote:
> syzbot asks to provide fixing commit in a particular format (and on 1
> line, otherwise not possible to parse back).
> 
> It sent this yesterday:
> https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ

This is Shuah's reply, not the syzbot original message.  Looks like
you cut and pasted the same URL twice?

The correct URL is:

https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/wQdqUSHuEQAJ

.. and it looks like what Syzbot sent was already line-wrapped:

>If the result looks correct, please mark the bug fixed by replying with:
>
>#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
>vhci_hub_control()

So I don't think you can blame this on how Shuah replied, or how
Mozilla handled things.  It looks like either Syzbot or more likely,
GMail on its outgoing path "added value" by line-wrapping the message,
probably because of the following MIME setting:

> Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Flowing text lines and deleting spaces is always, ALWAYS, a bad idea
when sending plain text.  In this case, it wasn't just a patch that
got corrupted, but the instructions from Syzbot, which it appears
Shuah followed faithfully.  :-)

IBM handled this problem by standing up an open source e-mail system
because Lotus Notes couldn't be fixed.  If we can't fix GMail, then
David Miller may be right, and e-mail may be doomed.  (I don't like
that answer myself, since so far all of the alternatives seem to be
categorically worse for our use case, but...)

						- Ted
