Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51824C43331
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 20:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22AFB21655
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573504725;
	bh=iZgOizmc+Vhy9mYsRhBKInN/t9bNfnXEciMqWJEbe3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0pBTmQoxe3b4YsYXj7dzQ7yd/MTnHMfkHVUtghrB9D9buWBXUd5u77nIAUd8f67ix
	 p25+g3u5drZJRJQZfvA6/wDlbOMHM12pdzk7gzMpVx1z6zuS8ooZQGr4UXEzbazhez
	 tmGZ6g0qTrxODFExs0p0OfhSQFZnPA4k6ToMyiOk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKKUio (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 15:38:44 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36658 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfKKUio (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 15:38:44 -0500
Received: by mail-qk1-f195.google.com with SMTP id d13so12415738qko.3
        for <workflows@vger.kernel.org>; Mon, 11 Nov 2019 12:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=FPEsAUF/U2CR+ep83/0JN403r72CqNKfZf1TUWy6n3k=;
        b=cRscDd3pIMvvoBhkzEP07OLmKJqPPDiEVhmLsPE1b+Bcp4r+fjQ0fe6VaUwMewhSXo
         kw/P2mc4hVJHdES8onnBr1xnWdzVdQMtpTKBw6J5SwLK9MKGoa7UPzxmH9idON1VvMZN
         f61GIqklf20XJ6D/HUm2/tYjxFfTDb+x1+Y8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=FPEsAUF/U2CR+ep83/0JN403r72CqNKfZf1TUWy6n3k=;
        b=Shsjt5xn5xAdaAGDa55WOzRam16RxMD9jqwggw8PbNR0egRW57PwEWfF0ZB+dbMDAm
         OuMscExHEQX+Mpi/Wnwa9kae5oM7AyeBN2a4vwjVfo3Lt8FBElrj7quN+rUNn6TTYSlD
         BtQXs1s73JcT2QI7V11CrQJf2i2+leBh6dJ5GLr5AFaSliaSEeBwoyDGGCY0G+XTSqmQ
         +n6nBydxS9DHbZyI8AF2J0m0Jj7ZfokUhZ0h+Sz5OhkN0oanF3VcGIiHIecdc81t6ZnY
         +7n+s4O0r2958Vzr+oadIrRUnbVnTyHGaNlSILUBwPfcCynpTlaur3FKI3xkjzJn8l+C
         Cdyw==
X-Gm-Message-State: APjAAAVZYbLC4kuJm3jkSufHV0YR9eBVfNMnlrqhsShe7Mm0nEW70Mms
        VPRSjntf0qDYKvtfxW7AfDO0Cg==
X-Google-Smtp-Source: APXvYqwN4CAWV4N5VCqhiYI0+lBdDbze5uViSjNeNUqcl4L60TyVYJJRbOByMpOIi3glWUbvDloswg==
X-Received: by 2002:a37:488:: with SMTP id 130mr12694188qke.491.1573504721972;
        Mon, 11 Nov 2019 12:38:41 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id 27sm12749255qtu.71.2019.11.11.12.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 12:38:41 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:38:39 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191111203839.lksfuquh7pdak2yl@chatter.i7.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
 <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
 <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
 <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 03:25:00PM +0100, Dmitry Vyukov wrote:
> > Would you like a mail sending account so you can use mail.kernel.org 
> > as
> > your outgoing smtp? We promise we won't do anything that nasty. :)
> >
> > -K
> 
> You know that we also serve Fuchsia, Akaros, FreeBSD, NetBSD, OpenBSD
> and potentially Windows and Darwin in the future, right? :)
> 
> How does that work? Currently we just call mail.Send:
> https://cloud.google.com/appengine/docs/standard/go/mail/reference
> and it magically does the thing. I can't even setup my own email
> client, so don't expect lots from me :)

I didn't realize you were using appengine, so I have no idea if using an 
external SMTP submission server is even feasible. I'm sure it can be 
done, but since you're serving all those other communities as well, that 
makes the offer of acting as a submission point a bit more tricky. :) 
Perhaps we can revisit this idea once you start publishing a feed?

-K
