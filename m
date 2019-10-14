Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29078ECE58D
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:53:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEA3020854
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="C2DdLC10"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfJNHxH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 03:53:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34427 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbfJNHxH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 03:53:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so13045169otp.1
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G86Lk8dD2qST88oOgU3uSaVwgc/K9lNvka48+4JRfn8=;
        b=C2DdLC10CG82CzrPVt1e2aqkClotOZauIj5Eak2kgE+NYhoQKjAM3Hi2p7SGM15UhR
         TJEs57PzO2hpRmxxiFDaQaMzP4/wkqTfaltS6thjYgEwwFbqDCxq2nZG34cxSvQDIGW0
         FGLlj0GGSg/WAnzDIFKXz+e3wtc3QlxVE8Qlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G86Lk8dD2qST88oOgU3uSaVwgc/K9lNvka48+4JRfn8=;
        b=iccHAmuhN2Wm5uBFyK1BMJje94GV3DvvPgZIqDB2coRjTevXbAD0sV+3Azdw9681eb
         V6KffsxihYr6L3WKPE3OSZXKy07Z1BAPaCU3Jr3NE/eB62mXpoaPPk6OUYR2NxvyZ0PI
         BRwXC19Htoo7LKOE00VhJXdtRIu+QBc1ix3wR+tPp5hiYisurzAaIsIb1j5NmC+U9bG+
         2LNBWmaAgdlOQNUZppf4Ks+sRI2yqabP1Hl0uuZgZAZl0aeufOdqA3CUMRDVnFwBtRN9
         aOaqRfU7Gv/5a9NlDGsGmsmCDeoFHRI9W7IJOoG8oIFD/HjjVkuENjSDXXFAGiJc3OYk
         odYw==
X-Gm-Message-State: APjAAAW5m6w1GqFut8lEYAEkgf/0XQPaelYP0L30xVCrBerM1t5HcNy5
        hMGNUkvI/pWeNZ9R0iw/TeZcv2eCPhwm7ad/eOv9RQ==
X-Google-Smtp-Source: APXvYqy83uKnpTX7yNwIXX2B1IuFgLXVsnaSW/+SZHOtSzyPbTyKQau6NBlDIDSn6+roN/qhEkZD+Yf52M115TrTybw=
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr24230231otb.188.1571039586539;
 Mon, 14 Oct 2019 00:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com> <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home> <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
 <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com> <a0836974-15b6-e62f-59bb-95c6ebd95058@gandi.net>
In-Reply-To: <a0836974-15b6-e62f-59bb-95c6ebd95058@gandi.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 14 Oct 2019 09:52:55 +0200
Message-ID: <CAKMK7uGwAvv87YQZshs+5r0424TirTDX3JSySMOupRp9uRPE0w@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Nicolas Belouin <nicolas.belouin@gandi.net>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>,
        Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 9:42 AM Nicolas Belouin
<nicolas.belouin@gandi.net> wrote:
>
>
>
> On 10/11/19 3:30 PM, Dmitry Vyukov wrote:
> > On Fri, Oct 11, 2019 at 3:19 PM Christian Brauner
> > <christian.brauner@ubuntu.com> wrote:
> >> On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
> >>> On Fri, 11 Oct 2019 11:33:35 +0200
> >>> Dmitry Vyukov <dvyukov@google.com> wrote:
> >>>
> >>>>> Let's try to figure out time then.
> >>>>> I propose the first day to not leave it to the last day and we may
> >>>>> need some follow up discussions.
> >>>>> On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> >>>>> 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> >>>>> people who want to attend?
> >>>>> What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> >>>>> prolong it to 12:00)? Any other time slot proposals?
> >>>> +Christian also expressed interest, his talks are 14:25 - 15:50 and
> >>>> 16:20 - 16:55 on Monday.
> >>> If everyone's giving a talk on Monday, can we do this meeting on
> >>> Tuesday?
> >>>
> >>> It's much easier to concentrate if you don't have to worry about a talk
> >>> you are about to give (or just finished).
> >> Seconded. :)
> > It's not that there is nothing on Tue, it's just that I looked only on
> > Monday schedule :)
> > For Tue I see for potentially interested people:
> > 09:00 - 09:20 Linus keynote
> > 11:00 - 12:00 Shuah Office Hours
> > 12:20 - 12:55 Rafael talk
> > Anything else?
> >
> > Tue is fine with me, I just did not want to leave it to the last day
> > because most likely it will take me a day to digest all info, so I
> > will be able to reply something meaningful only the next day. It would
> > be good to have some in-person conversations next day as well.
> >
> > Tue 14:00-15:00?
> I'd like to be here too and this proposition fits well in my planned
> schedule

Me too on both interest and slot.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
