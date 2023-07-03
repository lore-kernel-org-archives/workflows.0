Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67DAC001B3
	for <workflows@archiver.kernel.org>; Mon,  3 Jul 2023 19:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjGCT0g (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Jul 2023 15:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGCT0f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Jul 2023 15:26:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09457E5D
        for <workflows@vger.kernel.org>; Mon,  3 Jul 2023 12:26:34 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b7f223994fso37681885ad.3
        for <workflows@vger.kernel.org>; Mon, 03 Jul 2023 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688412393; x=1691004393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3p3eNAqggHvOy+dCovJCM+vn6jIvZSGl56iQugvFzQ=;
        b=JvOj5N/tPXqoXKZPklVGbU+WslPQ4ST7IRwV4EWSHBeAoe7yIXnwvdtwDouc4KfQBt
         5VkiccR26A0nCpCw6fRstWwArbXQTvcpYBOlLjx/Y7iMYGFskit08QSXc3HHIWF61EHy
         tTAFyr4T1VWyQ07Fk5oaGETFhJfstluuBzMAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688412393; x=1691004393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3p3eNAqggHvOy+dCovJCM+vn6jIvZSGl56iQugvFzQ=;
        b=lIMEYHYzAgBz2dVj4JBYxEcg5JHikwqo6QRH/Hq+0K3Zn0Sb/iSiUEay4mrbUzOjXZ
         wSyiDBqsbb931mpQdaqIVp5iXFblhql+KRs3/OFAZ1VMmBVewIS/uUDZFAfrt2lQEGMP
         sgu06vfU0tYA4AEbHxK6UMuX4Po2GN7ApsWZAmTwk2dCpnSWRTaX80xodG0jWiWKOXli
         5Bp17/3CZ+uh0XNznVBRZKVILKzVjEtEKEPHPrYIydHwLmV5PyKiYpzvKqp4dmbriPQX
         lHcUP7CQNxSiBGMSpPIbUNResgOusPnvu17Xv2jE3bavnIGP4CoxfnukNVkYedzWvY/W
         TrhQ==
X-Gm-Message-State: ABy/qLYaUuoiXy39yB/pw0uJUYUKF7a0/PqHsKF0bs+4sI0mmJ54brYR
        zVQzTfhDfNqHmCDu6rmYMZjmDg==
X-Google-Smtp-Source: APBJJlHmrCzeQOAdjx4aI0PP0e2RYfB1YXwITINUWE+FnGDO4EGqON8269xwvJS2l16nH2QEYoyTRg==
X-Received: by 2002:a17:902:cecb:b0:1b8:715:210 with SMTP id d11-20020a170902cecb00b001b807150210mr13913361plg.34.1688412393503;
        Mon, 03 Jul 2023 12:26:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jl3-20020a170903134300b001ac6b926621sm15597702plb.292.2023.07.03.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 12:26:32 -0700 (PDT)
Date:   Mon, 3 Jul 2023 12:26:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Willy Tarreau <w@1wt.eu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net,
        workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <202307031217.95B8803@keescook>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
 <202306301114.E199B136@keescook>
 <2023070213-capacity-moneybags-3668@gregkh>
 <ZKJJoK4kyOCEYcOR@1wt.eu>
 <2023070335-groggily-catfish-9ad5@gregkh>
 <202307031131.51907BC65@keescook>
 <2023070329-mangy-dipping-2ebd@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023070329-mangy-dipping-2ebd@gregkh>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Jul 03, 2023 at 09:05:15PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 03, 2023 at 11:35:37AM -0700, Kees Cook wrote:
> > On Mon, Jul 03, 2023 at 05:00:15PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Jul 03, 2023 at 06:08:00AM +0200, Willy Tarreau wrote:
> > > >   The security team does not assign CVEs, nor do we require them for
> > > >   reports or fixes, as this can needlessly complicate the process and may
> > > >   delay the bug handling.  If a reporter wishes to have a CVE identifier
> > > >   assigned, they should find one by themselves, for example by contacting
> > > >   MITRE directly.  However under no circumstances will a patch inclusion
> > > >   be delayed to wait for a CVE identifier to arrive.
> > > > 
> > > > This puts the responsibility for finding one in time on the reporter
> > > > depending on what they expect, and if they want it in the commit
> > > > message, they'd rather have one before reporting the problem.
> > > 
> > > Oh, nice wording, let me steal that!  :)
> > 
> > Yeah, this is good. The last sentence is a little hard to parse, so how
> > about this, with a little more rationale expansion:
> > 
> > However under no circumstances will patch publication be delayed for
> > CVE identifier assignment. Getting fixes landed takes precedence; the
> > CVE database entry will already reference the commit, so there is no loss
> > of information if the CVE is assigned later.
> 
> "simple is better" should be the key here, reading a wall of text is
> hard for people, so let me just keep the one new sentance that Willy
> proposed and if people still struggle with the whole CVEs and
> security@k.o mess in the future, we can revise it again.
> 
> Also, there is not really a "CVE database", I think that's what NVD from
> NIST does and CNNVD from China does, and "Something to be named in the
> future soon" will do for the EU.  There is a "CVE List" at cve.org, but
> that thing is always out of date, and for all of this I don't want to
> have to try to explain it in our document as that's nothing we want to
> mess with :)

Okay, fair, though please include something about it in the commit
log so that other folks with concerns similar to Mathias Krause's will
be answered:
https://infosec.exchange/@minipli/110632971830936754

I still think this version of the sentence is more readable:

However under no circumstances will patch publication be delayed for
CVE identifier assignment.

"patch inclusion" is less clear to me that "publication", and "be
delayed to wait for" is redundant: a delay is a wait, and "to arrive"
is just the assignment, which is the subject of the paragraph, so better
to keep the language for that consistent.

-Kees

-- 
Kees Cook
