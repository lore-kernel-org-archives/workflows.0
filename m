Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1383C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 21:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C34DF21835
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570570507;
	bh=TNP6ouuRxUTq4LxQDvrsXjL3o64hJuU3nkH4NR/cQEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QeT2Y7tV+kdcT42AG6q5o3Sukf5Z2D7BU5j0e9WPPQ+/g/muvDz/t+pdpZSTiTsmm
	 pqLnu5GYaVMxvLnUi+gwVE+P27BI3U/Ub3bNVKHXNH7++RXud5yLCKK+/jXa4pmpsh
	 qvQPfDMgHfi6qvjh6UgIUcYedHpdRCWtZm/ndi7w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730101AbfJHVfH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 17:35:07 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:35728 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfJHVfH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Oct 2019 17:35:07 -0400
Received: by mail-qk1-f170.google.com with SMTP id w2so300882qkf.2
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RM25FHo4/yLZoJrSMsjBhCnN0XZKqTEoFUhmkVig7cY=;
        b=M3UI82WoG5H0DzvJrXDPF0CvikXV5ExoLnqONCPh4Kf9YvgZ01FRloyPLY4fHTCnht
         JuwuH/QbKI5fwj3mqeDJetdUDBhYGxq4WOqDJS10atlSsU4EA2pKDWdGSuZHbsxvPUnJ
         +FiGXe9e8TSi/PO+HbKZErxbqdd87VR3HCBJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RM25FHo4/yLZoJrSMsjBhCnN0XZKqTEoFUhmkVig7cY=;
        b=LkXQqOSe7MZZfbiUkHTAJh+lLThex9hBi/oPGp5Ipn6Dv3KypSfyE0dRgEvT3svUn4
         YigdWtvtMZEnt/Q6zmv3FJ+c4HA9oqVV83DbJu2DEQwuH+srVnh+HwzzZaiD8ySlFqYA
         UI4Bh9i/xrC6eAS2Gn79nIPio22xcNRiZvSvSTdB2SuEenvYl6Ulbzd5CQ89gJ5XCbG5
         yqDzinpIm+yedYXriR6un1/2CvqD96kI97GhD8Cl8sTbW7e1ZAjKA1P4wu2zeovEXEGU
         a88d1eywttXNgHL8XUg+g8hVHdyYlGadPSucdiUJjDDbk7NEbcCsTwDoxWFH/6KdNu/E
         HJmQ==
X-Gm-Message-State: APjAAAW7PhuxH4zhqlNQqjgkDYkHdBnNwnCaSc8E9n0X4C3TMDWmKg/B
        Yzzrv/18U4txF8OMlWoPg5/BTg==
X-Google-Smtp-Source: APXvYqwbCbZGbnHd6lDRn3YhnNQ9djt6cJndQBSOBbHdzCMyuYngtTt45EjQL7dezveuCxv9ggKhaQ==
X-Received: by 2002:a05:620a:16b4:: with SMTP id s20mr281056qkj.53.1570570506008;
        Tue, 08 Oct 2019 14:35:06 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id o67sm9587qkf.8.2019.10.08.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 14:35:04 -0700 (PDT)
Date:   Tue, 8 Oct 2019 17:35:02 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Don Zickus <dzickus@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008213502.GA3591@pure.paranoia.local>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <20191008203249.olm2g2qosflcguuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191008203249.olm2g2qosflcguuk@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 08, 2019 at 04:32:49PM -0400, Don Zickus wrote:
> > This doesn't mean that forges are entirely out -- but they must remain mere
> > tools that participate in a globally decentralized, developer-attestable,
> > self-archiving messaging service. Maybe let's call that "kernel developer
> > bus" or "kdbus" -- pretty sure that name hasn't been used before.
> 
> If we flipped it around and used today's git-pull-request emails as trigger
> for forges to run their services, does cover some of your concerns?

Not really, because it doesn't preserve any records. A pull request is a
pointer to some code in a git repository somewhere. Like any pointer, it
is neither self-contained nor long-lived:

- the repo can be gone a month later (or that branch deleted)
- the PR does not preserve any discussions that happened around that
  code such as bug reports, test success/fail matrices, or peer reviews

It's also pretty inefficient, because it requires that the pull-request
submitter hosts a 1.5GB repository on a fast permanently-available
connection just so they can share a few lines of changes.

> git-pull-request emails can skip the patch-translation layer (like
> patchwork), run the automated tests, and utilize the current maintainer
> workflows.

Where do the test reports go after they are completed? How does the
maintainer find out that the tests succeeded? How does the next
developer after them -- say, 3 years later -- find out what tests ran
against that changeset before it was merged?

Instead of consolidating the fragmented landscape of Linux development,
we are further fracturing it and making it lossier. Currently, archival
efforts like lore.kernel.org at least preserve all discussions/reports
cc'd to the LKML, but I'm afraid that forges will render large parts of
the development process completely opaque.

I suggest that we stick to patch-based workflows and develop better
tooling and distribution fabric to replace SMTP -- redecentralizing
things in the process.

> The email issue is hard to resolve as some folks feel like it should be a
> primary vehicle while others feel it should be a secondary vehicle.

If forges are merely participants in the communication fabric, then it
doesn't matter which one is primary. In fact, email then becomes just
another bridge, so those who are not interested in switching away from
their current email-based workflow can continue using email.

-K
