Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12365C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFE3E218AE
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l3+6zYCR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbfKHJok (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 04:44:40 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36150 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730308AbfKHJok (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 04:44:40 -0500
Received: by mail-qt1-f196.google.com with SMTP id y10so5820597qto.3
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1Z+hfoMaYvOdH5sv/A+ARq1DnRjQlbBip8x5e2tIq4=;
        b=l3+6zYCR5L9cLmWXW0WKh1CrdHNS02tBwOxjhz+VgXJq030fpgNT+jo/iuMT2uyoO5
         rAVkVjoqay/lVYFgoA0+rDtUc0hvznZjzHjYlACRL64Pjr/zUCUASRh+f7aUEwKk85xC
         fLJpr87nWwg0MUPGis0b78mgws2g5Y6FhJuDK+h+J6mCq3gzerwzANqptIPD9mBMpbrf
         ofAWqqaT/S7xMkkHniHyRIoccjDR3x6Q8U1Gerbgwzkacnwnn8CaQfWztUoh4QwjcCG1
         y9WZQBqj509RVbYtrsMHNaQZXXFgAUjnEHDnV5y+gIBCOhRFhkA4XBBoinsfMWVuOIlf
         F7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1Z+hfoMaYvOdH5sv/A+ARq1DnRjQlbBip8x5e2tIq4=;
        b=sEg7UhilGdUc2IIV0Yk7BYWy2E1tBt9sKE3TrsicyGXdVCHcxxPVdK4Wf6auTS+k37
         JWeb2jmOE6It1IFzvRhCZh/aAsWHmyIvXT76uZEAytiwtftmoiacKhRHRz9XDuxrlSP3
         tBUjJ4PtI7xht/pLkOiM4fXiIRb3TVtHtgC8+Zc7tRRE+K1qYcWZIHUfeiIqzCsza0F6
         GScN7WFnLEMPAVStAdgJhJ8tXy6mdAMQYlt9oJpWhNzHqVU7X4Gan4icLLIaSvOkc3Wl
         NF+qURW+juCPfBIleJ7QbGjECB9u9o6I0+YKpB9Cmomu9v3/nY3EBlQRzzBY+Hccqj06
         z+Gg==
X-Gm-Message-State: APjAAAXXnhFMjihTxGpUb0CqLQWLQYNY/yJzgI+3VdQgAvB81IPIr+Th
        ozZhmfLUfBc+Lr84YETqx6WBD/hMlSpfEw6q3j0uBSYk3j4=
X-Google-Smtp-Source: APXvYqyTZjIj5akHc0Ig6DDtJAL0RpR90gTGX/1YzOish+s/TEoij0IMDAt1k/FTGpGA/dXWaWHgsItMKf0ePdx0SyI=
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr9494201qti.380.1573206278221;
 Fri, 08 Nov 2019 01:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
In-Reply-To: <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 10:44:25 +0100
Message-ID: <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 4:58 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > On 10/11/19 2:57 AM, Greg KH wrote:
> > > On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> > >> Hi, all:
> > >>
> > >> I would like to propose a new (large) feature to patchwork with the goal to
> > >> make the process of submitting a patch easier for newbies and people
> > >> generally less familiar with patch-based development. This was discussed
> > >> previously on the workflows list:
> > >> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> > >>
> > >> How I envision this would work:
> > >>
> > >> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> > >> - the patch submission screen has a succession of screens:
> > >>
> > >>   1. a screen with a single field allowing a user to paste a URL to     their
> > >> fork of the git repository. Once submitted, patchwork does a     "git
> > >> ls-remote" to attempt to get a list of refs and to verify that     this is
> > >> indeed a valid git repository
> > >
> > > s/valid git repository/valid git repository based on the kernel git tree/
> > >
> > > Otherwise you might be sending out lots of emails for other projects :)
> > >
> > >>
> > >>   2. next screen asks the user to select the ref to work from using the
> > >> list obtained from the remote. Once submitted, patchwork performs a     `git
> > >> clone --reference` to clone the repository locally using a     local fork of
> > >> the same repo to minimize object transfer. This part     requires that:
> > >>        a. patchwork project is configured with a path to a local fork,
> > >> if this feature is enabled for a project
> > >>        b. that fork is kept current via some mechanism outside of
> > >> patchwork (e.g. with grokmirror)
> > >>        c. there is some sanity-checking during the clone process to
> > >> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> > >> -- other suggestions welcome)
> > >>
> > >>   3. next screen asks the user to pick a starting commit from the log.
> > >> Once submitted, patchwork generates the patch from the commit     provided
> > >> to the tip of the branch selected by the user earlier,
> > >>      using git format-patch.
> > >>
> > >>   4. next screen asks the user to review the patch to make sure this is
> > >> what they want to submit. Once confirmed, patchwork performs two
> > >> admin-defined optional hooks:
> > >>
> > >>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> > >>        b. a sanity check hook (e.g. checkpatch.pl)
> > >
> > > I will note that many "first patch" submissions are checkpatch.pl
> > > cleanups for staging.  When doing that, I require that they do "one
> > > logical change per patch", which means that many of the individual
> > > patches themselves will not be checkpatch.pl clean, because many lines
> > > have multiple issues with them (tabs, spaces, format, length, etc.)
> > >
> > > So other than that minor thing, sounds interesting.  It's hard to
> > > determine just how difficult the whole "set up git and send a patch out"
> > > process is for people these days given the _huge_ numbers of new
> > > contributions we keep getting, and the numerous good tutorials we have
> > > created that spell out exactly how to do this.
> > >
> > > So you might be "solving" a problem that we don't really have.  It's
> > > hard to tell :(
> > >
> >
> > I agree with this. I don't think this a problem that is worth solving.
> > When a new developer wants to send a patch, they don't need to create
> > any accounts. They setup their email client and send patch.
> >
> > We have several resources that walk them through setting up email
> > clients and sending patches. checkpatch.pl can be automated with
> > git hooks.
> >
> > >> I know this is a pretty big RFE, and I would like to hear your thoughts
> > >> about this. If there is general agreement that this is doable/good idea, I
> > >> may be able to come up with funding for this development as part of the
> > >> overall tooling improvement proposal.
> > >
> > > The workflow seems sane, and matches what most people do today, with the
> > > exception that it "solves" the git send-email issue, right?  Is that our
> > > biggest barrier?
> > >
> > > I would recommend interviewing some of the recent kernel mentor project
> > > and outreachy applicants first, to try to determine exactly what their
> > > problems, if any, were with our development process.  If they say that
> > > this type of tool/workflow would have saved them hours of time and
> > > energy, then that's a great indication that we should try to do this.
> > >
> >
> > I would say considering the number of applicants to mentorship program
> > and new developers it will be lot overhead to require them to create
> > patchwork accounts, and it might even be hard overtime. A lot of them
> > start out and drop out in the middle. With the current setup, nothing
> > to cleanup.
> >
> > Setting up email clients and git hooks is one time task. It is the
> > easiest of the learning curve for many new developers. New developers
> > struggle with getting the change logs right, coding styles right, and
> > responding to review comments and acting on them.
> >
> > These aren't something that can be automated and they just have to
> > learn through experience of sending patches.
> >
> > My opinion based on contact with new developers as well running the
> > mentorship program, I would sat this isn't something that needs
> > solving.

As yet another data point re emails.
Shuah, you are aware that you can't send proper emails either? ;)

syzbot asks to provide fixing commit in a particular format (and on 1
line, otherwise not possible to parse back).

It sent this yesterday:
https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ
-------------------
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

If the result looks correct, please mark the bug fixed by replying with:
#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
vhci_hub_control()
-------------------

(Not sure you will be able to see what exactly I am sending after my
email client, so resort to the link for exact content :))

Which is still presumably correct: "format=flowed; delsp=yes" + 2
spaces before line wrap.

However, what you replied is corrupted:
https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ
-------------------
#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
vhci_hub_control()
-------------------

Which means that the bug is fixed with "usb: usbip: Fix BUG: KASAN:
slab-out-of-bounds in" (last part is omitted). And this is what syzbot
has recorded:
https://syzkaller.appspot.com/bug?extid=600b03e0cf1b73bb23c4

Such commit never existed, so syzbot will get back to you in future
suggesting that the commit you provided is incorrect and asking to
provide a correct one.

That's what happens when you try to build processes around email...



> > thanks,
> > -- Shuah
>
>
> As one data point, I cannot send emails with git send-email anymore.
> It used to work, then broke and I don't know how to fix it. Now it says:
>
> 5.7.8 Username and Password not accepted. Learn more at
> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> s10sm8376885wrr.5 - gsmtp
>
> I suspect it has something to do with two factor auth.
> So that's it: it cannot contribute to kernel right now.
> I will not consider time spent fixing it as useful time investment.
>
> Any kernel documentation that I can find for gmail, mentions config
> that I am already using and that is not working:
> https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
>
> As another data point, I spoke to KP Singh at the Plumbers. He is a
> "returning" kernel developer (so already did this before), he said it
> took him 3 days and 52 configurations changes (all were committed to
> git, so was possible to count exactly) to setup mail client properly.
> And he is "staffed" to do kernel work, I would expect that most people
> who don't _have_ to do kernel contributions will turn away half-way.
>
> As another data point, several people told me that they are afraid of
> sending kernel patches b/c there is so much "on you" to do right.
>
> I would say that we need to aim at  a process that does not require a
> friendly experienced person to answer any of your questions in the
> common case. Lots of people will simply not ask any questions.
