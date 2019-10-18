Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA87CA9EA0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 19:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7AA72070B
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571425389;
	bh=Ah1pruIW/f14BwjkfRxuYH/OP31GizbtONWaasMQPzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RDTnAFszY/QhA0VTPu+jWvIQTLcVYdCNuHFfPSYTxBe9e6CWy1Mrf9SwuGjjw5U9M
	 435rBw7QaA70bQw6KEh94cX6rOMnns8oCe56VQNEEdRAMXNvZiWHfpB1MQKxmy6Npu
	 YyqCA84TeKlgAp+jvmy0QTR1xmCwpzo+plcqZ78Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394715AbfJRTDJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 15:03:09 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:34864 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbfJRTDJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Oct 2019 15:03:09 -0400
Received: by mail-qk1-f169.google.com with SMTP id w2so6303217qkf.2
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jAUYl2LFHuI0nZ5F8d3gjdxT8OkBtQKPFPcAUvkEp1w=;
        b=aL58uY6E+x50boA50isn6YiJqJFSVPLSDQW4vuuBgUmQMJ6/dBBTBURVhjQa5vmufn
         UaPTEODAbr0lp9B6C1jIKbza+ksTLrBYw/zX5+6aAUH2YijiX7+KYt+AP7O8knDwrIzO
         57epPQ2286uCelD/cHOkTnMSmPg5eRAbug2vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAUYl2LFHuI0nZ5F8d3gjdxT8OkBtQKPFPcAUvkEp1w=;
        b=uOcH0jL53RBnYU6cw8Y4XY0MS/sJAli+xQ+LXk+1OHR+8rbGyMVysAVFbw68gNz5gZ
         Z32WgTmINI7UzZj775vVuv2UviqiBYKOHaCYiLNR08LhRtVPmFe7arVTwKI8Ps0RUQHo
         sIa93Gr6UjAJxo4aXR+jND4RRPVwrn6R819poPEHEsind5GGPoJ9bsc6Vh8bENaQwu88
         xqtDbqYzguhEWmPjiKlE9w+ucceZJrw3IK/bCIMj6aEPwJ5QT6NolBdu28glqzOkDt4k
         mwa404b8EenzMXpQzquizm186V3OU5Q2+01ZHAzP9KferBKLo7sxlyhtCamZyyJD5OUw
         o9Ww==
X-Gm-Message-State: APjAAAUegKHeZf97m7/rGardl2SQYmQ80n1tv3/4vpNSlClZG/J/S4Mk
        R5JEModCAkt0/97ZnZBZJmzp3s1Ub3U=
X-Google-Smtp-Source: APXvYqwtHuwnjv/9Bx9H7PyX/F535XklC1Fgc/a3pl90xQFTJNF2ZNNNMj6R1h07U47KG+zDGwCEug==
X-Received: by 2002:a05:620a:1030:: with SMTP id a16mr10113451qkk.150.1571425387725;
        Fri, 18 Oct 2019 12:03:07 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id 194sm3154696qkm.62.2019.10.18.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 12:03:07 -0700 (PDT)
Date:   Fri, 18 Oct 2019 15:03:05 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: workflow problems and possible public-inbox solutions
Message-ID: <20191018190305.GF25456@chatter.i7.local>
References: <20191018032516.GB29290@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191018032516.GB29290@dcvr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 18, 2019 at 03:25:16AM +0000, Eric Wong wrote:
>It seems like there's a bunch of problems the workflows@vger
>list is trying to solve.  Some can be solved independently
>of others.
>
>Here's a summary of them and where items in
>https://public-inbox.org/TODO list can be possible solution
>(I'm not claiming it can solve everything :P)

Well, then you'd have to rename the project as "emacs". :)

>1. vger deliverability problems to major mail providers
>
>(NNTP|public-inbox) => POP3 bridge, since all major providers
>support importing mail from POP3.
>
> https://public-inbox.org/meta/20160411034104.GA7817@dcvr.yhbt.net/
>
>Locally-run NNTP -> mail fetchers can also work, but requires
>more effort to setup.

There is also this:
https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git/

With a bit more tweaking (see TODO), it can be made into a very nice 
generic interface tool -- in fact, I hope to use it at some point for 
feeding patches into patchwork instead of piping directly from postfix.

>2. attestation of messages
>
>Self-publishing "Sent Mail" folders via NNTP or git,
>(similar to Certificate Transparency):
>https://lore.kernel.org/workflows/20191010192852.wl622ijvyy6i6tiu@chatter.i7.local/
>
>This would provide redundancy, too; and it's probably more
>usable and learnable than GPG :P

Well, it still uses GPG, but it hides away the horrible parts. The 
easiest way to accomplish auto-signing is to create a dedicated ECC 
subkey and store it (and just it) in a dedicated dir used by the 
self-publishing tool.

>4. secret exchanges for embargoed issues
>
>No idea, really; not my department :P
>
>It would be good if all messages in the exchange can be
>published and mirrored once the embargo is lifted, though.

There is ongoing separate effort to address this, using remail:
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/remail.git/

I haven't started implementing it yet, but my hope is to provide builtin 
archives that can be released once the embargo is lifted.

-K
