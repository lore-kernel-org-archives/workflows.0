Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB20C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F45121D6C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fulmUMy+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfKHOLo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:11:44 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39665 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfKHOLo (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:11:44 -0500
Received: by mail-qk1-f194.google.com with SMTP id 15so5350566qkh.6
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wlh4H1CctmH+czVqb5RRkK5JC20rIUkr2tIIk+AtxrA=;
        b=fulmUMy+k74csPe36eO03zdXocWmbuMoc3BPvCsGqwKrf3GF4Fxv3kBzUnVA1R5OKo
         dzNnBFl36hSMZHl3KCiNF/vEUK22WwAcrN8crHYlHdF1P35lPv4kBVqRPNQIO9/EXW6T
         icV0DVdKg8EXx/c4+Q/26Qp1Uk6pDeWhqdIOcz+8y5TvUFsPgFDMstUL+wAsDvNDx4pV
         GrWU2C0mwTyzIOuJKfUVwVBEF+QaA330eLXDLq4ZNVmJhZJYQtXgjg9flRf1cW3nKXcz
         UqTL9ayri4zDQ8TiNpkzxz8cce2oIxuzb02kox+cqQx2nuWDJTF3n1aeMZkdZ+3Sl1o5
         wUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wlh4H1CctmH+czVqb5RRkK5JC20rIUkr2tIIk+AtxrA=;
        b=aPihf+JuZW5YXBHkfH1jIh1sSlHl57bfwk9pWdCJOyQhIaq1wPXEWOMZ9qiOuO3X9Q
         P5+xm45TYmgQcLsx/H85xmqKxhWs+EnItevrSt+6lhhG4PYyJpTjZSmd4Nb3XDA2A4ge
         JMYZSm2rUSA/xYx9MXwyDHfEWGRWDYdbaSIm3eQDYH9lHznKjKdfVFo8HiWPafQ4Ygxp
         oRy6PqteV7qfO/H0bjaggLhP202Cy0LSYJC0aIKS0nL7W3/jDUz/IJ0w6qq5dJPSg74+
         xE0XafHacJ+afR1s0W5Mgs1VoJ32bfKgO+sctXyhs/wV+hExlOyOk/I0BwYIb0FLjUaG
         flTQ==
X-Gm-Message-State: APjAAAXgtFIno9K4VoY+Y6t7sa3mGHIJ2QTzXzs69oSoFVn636xbRlME
        Ogv1wIVTlZ1bPUEjspDfgVwXQI/WHEH8ezUeQ9Ve9A==
X-Google-Smtp-Source: APXvYqzV/vIvdDf4OcBK9OszYku8+0Kgd8TVMA5GPNIbmeUQF2MLr33FPmMjEJuyKdTL6AC8xruNzQAWNG7FEcdplDk=
X-Received: by 2002:a37:6845:: with SMTP id d66mr8550467qkc.407.1573222303026;
 Fri, 08 Nov 2019 06:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com> <20191108140249.GA23325@mit.edu>
In-Reply-To: <20191108140249.GA23325@mit.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 15:11:29 +0100
Message-ID: <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 8, 2019 at 3:02 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Nov 08, 2019 at 10:44:25AM +0100, Dmitry Vyukov wrote:
> > syzbot asks to provide fixing commit in a particular format (and on 1
> > line, otherwise not possible to parse back).
> >
> > It sent this yesterday:
> > https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ
>
> This is Shuah's reply, not the syzbot original message.  Looks like
> you cut and pasted the same URL twice?
>
> The correct URL is:
>
> https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/wQdqUSHuEQAJ
>
> .. and it looks like what Syzbot sent was already line-wrapped:
>
> >If the result looks correct, please mark the bug fixed by replying with:
> >
> >#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
> >vhci_hub_control()
>
> So I don't think you can blame this on how Shuah replied, or how
> Mozilla handled things.  It looks like either Syzbot or more likely,
> GMail on its outgoing path "added value" by line-wrapping the message,
> probably because of the following MIME setting:
>
> > Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
>
> Flowing text lines and deleting spaces is always, ALWAYS, a bad idea
> when sending plain text.  In this case, it wasn't just a patch that
> got corrupted, but the instructions from Syzbot, which it appears
> Shuah followed faithfully.  :-)

Looks correct to me. See the DelSp=yes part here:
https://tools.ietf.org/html/rfc3676
But I agree this is insanity. But that's exactly the point.


> IBM handled this problem by standing up an open source e-mail system
> because Lotus Notes couldn't be fixed.  If we can't fix GMail, then
> David Miller may be right, and e-mail may be doomed.  (I don't like
> that answer myself, since so far all of the alternatives seem to be
> categorically worse for our use case, but...)
>
>                                                 - Ted
