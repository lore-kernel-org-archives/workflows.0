Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F15CC43331
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 09:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4E562075C
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 09:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iV8g2Hvw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfKKJfZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 04:35:25 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37745 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfKKJfZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 04:35:25 -0500
Received: by mail-qk1-f196.google.com with SMTP id e187so10608722qkf.4
        for <workflows@vger.kernel.org>; Mon, 11 Nov 2019 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zl4Yc19dsI4TqUzjI/sOKI8FT9toOAIX2j/gCYRc7TA=;
        b=iV8g2HvwZeoVtjhSJK3AH2DSJ1t6W0xrbKBxyxyNkU9wKC5ifZKqlZyKvx3z52bGhL
         yEZ7wjaN7nE0o44n9OHWBstUuw40zS+FwVc8yDVk3qZ7te2Og5pdhMKe7SXrjDR/eka7
         lgVBUdwpp3tAVmpa+sZaS0fiI7YGD/rP+M70Ltq93Hd0J62PoMEnX2ECFhkEFqWmY0ZD
         HDk4ZO8aClnw5KN4Hw3OviXaU1/7RI96/LFOI/O4R2xzY5steMFxWBBfkm+UCVm/lzVG
         LkGaCgMi02RApHPECHS+sgjEm0XhB6hLkQDATmtkwJUku7rdCD8uhUWhbVm0apn7k7Ji
         sizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zl4Yc19dsI4TqUzjI/sOKI8FT9toOAIX2j/gCYRc7TA=;
        b=g8BrD5vRKWc+7ieFgBkjA0c0H+C2s9mLTox4TDIBRHrjdh7Mn0eGhdEl3WPDdOgHHv
         pczDo4we3jYowE9l3SWxsp4S++1t/dG+JvNWMO4ziIV9CbzOCWNTQO7hdPKlrkqR4fOc
         UoLnOtJNSYODO+fFABjrVM/hI00uTXouICiGccMr35Bt7+xxTYJsVIaT66Wg1CVhj+47
         Y11WDSFCoV4EoGNPnExhaOIvucs2rnpN1EXJLkjhkMN2WA/XplydRoYGyMiqzDsI0lr0
         68SYunON9YHVTYtP0Rc9rrAFMw7AzgM2SO7tjSj928UwEMgoghuemDF3QuLa/i6fcdge
         2lzA==
X-Gm-Message-State: APjAAAWK1gySUac/qwDLeToADelZiKKw7fDb0JNUupEyntPy+ThZNp2L
        D0WbvdjeFsJN5xZKxIPYCgUr5jR/iftnWeL4FI/1kCyJ3uE=
X-Google-Smtp-Source: APXvYqw4qYJbSsUQCqfUV5J5mNKPSBkTMDyCJjDrrVPrmnaJwUGl93rRE8cyJl+kR+TSl9MTrUUM2u9F3SRTLve+91Y=
X-Received: by 2002:a37:a94b:: with SMTP id s72mr6900677qke.256.1573464923933;
 Mon, 11 Nov 2019 01:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu> <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
 <20191108141707.2yfxoychd5j3oewn@chatter.i7.local> <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
 <20191109043106.GC23325@mit.edu>
In-Reply-To: <20191109043106.GC23325@mit.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 11 Nov 2019 10:35:10 +0100
Message-ID: <CACT4Y+a1NsFgaLYx4JQORLoyUs35PDwVt1f-PoiJYv-u8AZw1g@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, Nov 9, 2019 at 5:31 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Nov 08, 2019 at 03:25:00PM +0100, Dmitry Vyukov wrote:
> >
> > It has the format=flowed; delsp=yes part:
> >
> > Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
> >
> > Which according to https://tools.ietf.org/html/rfc3676 seems to mean
> > that that line is not wrapped: new line and 1 space needs to be
> > removed as part of decoding it.
>
> Actually if you read RFC 3676 carefully, the receiver MAY decode as
> you have described above.  It's not even a SHOULD or a MUST.
>
> Essentially format=flowed is only supposed to be used when it's
> considered OK for the receiver to reflow (or not) the lines any darned
> way it wants.
>
> If you use format=flowed in a context where (a) there might be
> whitespace at the end of lines, and random reflowing is a really bad
> idea (e.g., C/C++/Python/Java source files, or patches), or (b) where
> you really care about whether line breaks when text is quoted and used
> in replies (e.g., syzbot's parser which cares about line breaks), you
> MUST NOT use format=flowed, or things will only end in tears.

You are right.
syzbot email only MAY be correct :)
But for me the point re email still stands: why are we even spending
time discussing this? Why are there such extensions with MAY status?
If one doesn't care if the received with recover the original message
or not, why caring adding/specifying these "format=flowed;
delsp=yes"?...
Obviously somebody in the middle got confused about these flowed/delsp
as well and either assumed that they are MUST or assumed that
preserving precise text for emails is just never important...

> If the problem here is that syzbot mail, and the responses to its
> mails, can't be broken in random places, or syzbot parser will be
> unhappy.  In that case, you shouldn't have sent it using format=flowed
> in the first place.  There are other MIME text formats that are
> appropriate in that particular case, but format=flowed is not one of
> them.  And if GMail doesn't give you that option, then I suggest that
> you either make the Syzbot parser more forgiving, or you find another
> mail transport agent.

I don't see how it's possible to make it more forgiving without also
appending unrelated text that happened to be on subsequent lines to
patch titles and breaking everything the other way.
I added one partial escape hatch in the form of:

#syz fix:
whole-title-goes-on-the-next-line

This allows to send slightly longer titles. This is still parsable as
we know that commit titles can't be empty.

Regarding another mail agent: again this only proves the point for me:
this is what tool developers are forced to be spending their resources
on, rather then working on adding more useful features...
I don't even know where to start re switching mail transport; how much
the switch will cost? what are other transport costs in the long term
maintenance? what are their problems?
