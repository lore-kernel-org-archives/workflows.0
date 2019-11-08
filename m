Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE0CFA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1329520659
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uHJvz9BX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfKHONF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:13:05 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45472 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfKHONF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:13:05 -0500
Received: by mail-qt1-f195.google.com with SMTP id 30so6576985qtz.12
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hFUIWr4rQxVfIOk/xpE50AD7Bz7DrIgDJErqqcFB5nU=;
        b=uHJvz9BXRIgyMq88pw21qSkKXz/CZqRjhBYuCEYENsBEWgfEWRVdCc/6JxoNq6/BHt
         37/Fo12nW3/9JqzIXHp52fijKy9ADrMtHibwbNhlbUg/zgQUFLDV69KXxO+X/BKIow53
         GYPxdyXg2CM33zTKsvvgaPL5pr9KLbcGSFDgcp4K7WuBb511RjTZbvywhXFbMOn+dbiw
         RQJR3khjLa0+FFhv8aun5rjNMwbo1giCY5dXz4TdXgUchetmCsCfakGLIH9CQ+u1vAW/
         56EnClFCm5E0gmMSgmhZuRNU0mlRKESSMTPazcvXqMhY+ZdcSIwgdFsLTpbUI91FuJRV
         N8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFUIWr4rQxVfIOk/xpE50AD7Bz7DrIgDJErqqcFB5nU=;
        b=gwxJHI71eAxHggg042Rii92fEAhq6+3UoCO7ahYv5X2GGmDZprEvsZIESSYiEoQQnn
         EgwQb5pjG5mUi5y8i/Mh72Oe3fdyLHwmogQW1EbwAyreRTpJdbmp0fdneW3biXeQIk0Z
         Zsv9iY9818Ywj1NiAVD38FZDaAh89WhtSlkOds9PT8J5kKer3EPpyl+itziOnnP2c/FM
         mN/xd9Y0CMwiTjHCeZJgAkzyHNtZ9VnZ1agHERSWYODY7IZNqjNS/i3bEhOs7UnRmMEb
         KM3XYTxnO8flrSa+bxFKKtZhYzGrLvNl0uQQ7E4xpMj/r9Bom7BbY/f2rt8qSNBv82jt
         mJqg==
X-Gm-Message-State: APjAAAWRejHcbPWtkzv2KFoClgTk8n4sDn5wUjkAu4OzUWj0+A0Rv9d4
        haLWI++6cpTvW+u7SDk/8KgZ1644hpvNlhJqrRzc6w==
X-Google-Smtp-Source: APXvYqye04DtMZ38lefkJY3wN4gC4WC9hlYTBZbqeLC5VeT0WUtxhbbRKsjFq8rWfwUwp8g2MZHSujRHZXLCG4GL8Jg=
X-Received: by 2002:ac8:5514:: with SMTP id j20mr10415707qtq.257.1573222384108;
 Fri, 08 Nov 2019 06:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu> <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
In-Reply-To: <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 15:12:51 +0100
Message-ID: <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
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

On Fri, Nov 8, 2019 at 3:11 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Nov 8, 2019 at 3:02 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Fri, Nov 08, 2019 at 10:44:25AM +0100, Dmitry Vyukov wrote:
> > > syzbot asks to provide fixing commit in a particular format (and on 1
> > > line, otherwise not possible to parse back).
> > >
> > > It sent this yesterday:
> > > https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ
> >
> > This is Shuah's reply, not the syzbot original message.  Looks like
> > you cut and pasted the same URL twice?
> >
> > The correct URL is:
> >
> > https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/wQdqUSHuEQAJ
> >
> > .. and it looks like what Syzbot sent was already line-wrapped:
> >
> > >If the result looks correct, please mark the bug fixed by replying with:
> > >
> > >#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
> > >vhci_hub_control()
> >
> > So I don't think you can blame this on how Shuah replied, or how
> > Mozilla handled things.  It looks like either Syzbot or more likely,
> > GMail on its outgoing path "added value" by line-wrapping the message,
> > probably because of the following MIME setting:
> >
> > > Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
> >
> > Flowing text lines and deleting spaces is always, ALWAYS, a bad idea
> > when sending plain text.  In this case, it wasn't just a patch that
> > got corrupted, but the instructions from Syzbot, which it appears
> > Shuah followed faithfully.  :-)
>
> Looks correct to me. See the DelSp=yes part here:
> https://tools.ietf.org/html/rfc3676
> But I agree this is insanity. But that's exactly the point.

Just to clarify: syzbot does not do this on purpose. It generates and
hands off unwrapped lines. The "format=flowed; delsp=yes" part was
done by somebody else.

> > IBM handled this problem by standing up an open source e-mail system
> > because Lotus Notes couldn't be fixed.  If we can't fix GMail, then
> > David Miller may be right, and e-mail may be doomed.  (I don't like
> > that answer myself, since so far all of the alternatives seem to be
> > categorically worse for our use case, but...)
> >
> >                                                 - Ted
