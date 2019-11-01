Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5562FCA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 17:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 298952085B
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572629355;
	bh=OJfPbQJo2r83o4iX9qEG1d4DfPPZ8d5luZJHB4lANXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OvTMfBfPv06VQP3PPLT9gUxKmhXujvXRrZ9KHAGpu8htiSOiTdGuLzwP9KO2m+spO
	 9FeY14IedQdbdZmBPaPOD1wQ5a06aefdDyu01A3ejou1E+OnYWDtdjhoA/C6cVeEaG
	 KoTCFYh/BExZ7wSvJLICE9QYNIdVSV2M8z876V5Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbfKAR3O (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 13:29:14 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:37480 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfKAR3O (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 13:29:14 -0400
Received: by mail-qt1-f182.google.com with SMTP id g50so13875827qtb.4
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=8tCJM9E8701v36OBg9sCAwq5xUfWP8ts24ZHEsqMV6o=;
        b=Pn9YSlId6XKNU71bzQilo4oreDtHVnl6HLHfRDBMiqulWnA29bjhMXzPdb4lfhdDoW
         sfr0qvaExXUW1eyIHJHRNQ8ygoSA2oWOy1P6vL+BTAcoUiq3w2YVCt0J2437SpNY7l4O
         x/dqgY1mM7pUCoyTPLlvHA19zale6QM8qJX+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=8tCJM9E8701v36OBg9sCAwq5xUfWP8ts24ZHEsqMV6o=;
        b=o5zcWBUxL7ik8Z1srYItA4PfjKreZvRHQVWV526MRWFwFFsHm/1MIG+gt7bBIMs1HJ
         bZdbWNBtK1Ex0SrB+hX22viOh1ON4UucAYDpVI+Pk3HTfLOuLmT3uuepSz7+x0iOd6Aa
         0ohOFsig6aVoWeRHYlagky+oNEohi3r7MGwYSqk4CLC1hGqtHBbyrXgTNT9X0I8oHMZM
         ySigI71Kz12nLApskM7tuFMy6JqxRxeYVjlzgFcsVdRKatQc93z8Rbdc+eeLpusfMGVP
         kevKsVLHKZ8eegSGkfgr6IsA9XA6aYg9sW8TiehyZaRCuBiwSeoTnvHZBAapqIlzE8Lb
         NXWQ==
X-Gm-Message-State: APjAAAXVVsPcNllNGdznUSFhTKveY/QyM8WCrUyq34GC6lnSO7q/26Jy
        x70+/dgSIDTX0qoAO+nV/915Pw==
X-Google-Smtp-Source: APXvYqxnFSMB9YIs+pPyTJh0hHVJcja91UjG9niSuDCoAe0Xg84SZCdJ6dSi7/CoL8pAdJ9yBtjO+w==
X-Received: by 2002:aed:2cc5:: with SMTP id g63mr416929qtd.205.1572629353351;
        Fri, 01 Nov 2019 10:29:13 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id p2sm3016575qkf.112.2019.11.01.10.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 10:29:12 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:29:10 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191101172910.x7neoilwaotj5njb@pure.paranoia.local>
Mail-Followup-To: Daniel Axtens <dja@axtens.net>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
References: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
 <87wocnmb8j.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wocnmb8j.fsf@dja-thinkpad.axtens.net>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 30, 2019 at 09:35:08AM +1100, Daniel Axtens wrote:
> > KR: write local command to work with patchwork.
> We have a couple of local commands already, pwclient and git-pw. Is
> there something new that would be helpful?
> 
> As an aside, I know offline stuff has come up a few times, and I think
> it should be reasonably straightforward to make a caching API client
> that can buffer your requests until you're next online. I don't have any
> cycles to do this, but I'm happy to help anyone who does.

This is part of the tooling work that we discussed and I plan to have a
more elaborate proposal finalized next week. We are hoping to fund the
development of two closely related tools, one CLI and another using the
browser interface, using a web server available over a localhost (or a
local network) connection.

The overall set of features for the web-interface would be:

1. Run the web interface locally in a container, to be accessed over
   localhost
2. Use public-inbox feeds as the source of incoming patches, allowing to
   pre-filter by:
   - list-id
   - from/to/cc
   - keywords
   - patch file path
3. Integrate natively with the local repository to allow the following
   functionality:
   - apply series directly to the repo, from the proper base-commit parent
   - recognize patches that have already been applied and auto-archive
     them as necessary (current kernel.org's patchwork-bot functionality)
4. Offer code-review features using the web interface (something
   similar to gerrit), with outgoing email sent back out to the
   submitter (plus list, cc's, etc), using the reviewer's own From: and
   smtp server information

For the lack of a better term, I'm calling it "local patchwork", though
it's more likely to be a closely related spin-off that would hopefully
share a lot of code with patchwork and be able to both benefit from
upstream and to commit code back up for any shared functionality.

Caveat: this is not finalized and I will be putting up the proper
proposal up for a discussion here. Since we're talking about both a CLI
and a web interface to largely the same functionality, it's possible
that instead of attempting to run patchwork in a container, it would
make a lot more sense to run a daemon exposing a REST API that both the
CLI tool and the web tool would consume. However, this would require
rewriting a whole lot of things from scratch and would end up a lot more
difficult to both fund and develop -- which is why I'm leaning towards
adding these features to Patchwork instead.

-K
