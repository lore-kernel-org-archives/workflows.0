Return-Path: <SRS0=/nb3=ZE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83F1C43331
	for <workflows@archiver.kernel.org>; Tue, 12 Nov 2019 22:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C96721925
	for <workflows@archiver.kernel.org>; Tue, 12 Nov 2019 22:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573599245;
	bh=D74m9T4oEvj/07+yMZZqB15bDYw73cwrVsndqKk6KoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qvUW3Wd9U780Q06VZtreLluuGQOu+s20I1b2Y1L+T/2F30q1SOJQgXbZ60yAtw8Ne
	 qmLC3v/5NfYYWglKKwlhDkAundOsFDz/HiOh69WW1Qiq6eP3IWkSP2c2GWbBAAQ8aC
	 3+diawBLouRDN4dT9D4t6jQzFEveiqdaeqMT9kD8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLWyF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 12 Nov 2019 17:54:05 -0500
Received: from mail-qt1-f175.google.com ([209.85.160.175]:32812 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKLWyF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 12 Nov 2019 17:54:05 -0500
Received: by mail-qt1-f175.google.com with SMTP id y39so390938qty.0
        for <workflows@vger.kernel.org>; Tue, 12 Nov 2019 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4Ty559yLhaK3KBphKEVaY1Npq52xHc/V9GYIFkeTYM=;
        b=EaEDvu7ur3Rwi4SOz4NgVkbCNiFF1FDmNb8cwY0WTJJRD6R0F10ShDMQnAfdv8JryF
         UADpgKknEl87ABZlL2hdJVQU8OUGe+q7Vk3RsdAyKeyo98tAKyMRjvvKk9NfHdmlb+c7
         qNPwuamv+nPeqAbUFlCm+8hS7XgoOvxGxHUQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=H4Ty559yLhaK3KBphKEVaY1Npq52xHc/V9GYIFkeTYM=;
        b=A8UvmCZoSb811qj6gtg9OSQBSbAfB+pTCed6j9S1lbr118co2i0JH1b7cC1tzXR7FI
         bLOkXk3AnATc0k290UERNFDdvKGtsP78zJD1qFJTlVa7zukGHlESJM+Z35xbNb67z+sW
         JxNb5liOyp+GphLwxr2tT0SY0rH2baLETQcNZiIGBCkSk8ERs9D6X2Gm+0pez2D39w51
         /T4+/MK6bET5P4Sh2jfJFNetxwgo8ihmTmU5Hr6BgDZkIeSYoP+Sgqbhl6nr5GL1S8lU
         ZNYRkG1i+FoEu9cHAjpa99ldJhyNettw08FANCKN5i6fTN9/IRWrjyOt9wEFMvwdqErW
         d6/w==
X-Gm-Message-State: APjAAAVvkmdAEPHnIqAIaLwMI/3ELI5U/U5G/f4LAZSU5UB0m09tjtwz
        GUibu4Zdrqu23ZHK4ea74XkRpeJECanp/A==
X-Google-Smtp-Source: APXvYqwixx1XVnRTL+iRuSdejdjyF7yOD55ZBKXgnL0BxKbJ/4L9vVA+76AzD2wsUettF1OjQnH2aA==
X-Received: by 2002:ac8:27a2:: with SMTP id w31mr34594419qtw.227.1573599242548;
        Tue, 12 Nov 2019 14:54:02 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id a2sm49210qkl.71.2019.11.12.14.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:54:02 -0800 (PST)
Date:   Tue, 12 Nov 2019 17:54:00 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
Message-ID: <20191112225400.fcywxx74kugxerue@chatter.i7.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
        workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 05, 2019 at 11:02:21AM +0100, Dmitry Vyukov wrote:
> Hi,
> 
> This is another follow up after Lyon meetings. The main discussion was
> mainly around email process (attestation, archival, etc):
> https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
> 
> I think providing info in a structured form is the key for allowing
> building more tooling and automation at a reasonable price. So I
> discussed with CI/Gerrit people and Konstantin how the structured
> information can fit into the current "feeds model" and what would be
> the next steps for bringing it to life.

BTW, someone recently highlighted the following project to me:

https://openci.io (certificate lapsed, so ignore the browser warning)

The goal of this workgroup was to establish cross-ci communication using 
pubsub subscriptions and broadcasted events. The following docs may be 
of interest to people on this list:

https://event-driven-federated-cicd.openci.io/key-considerations-and-contraints
https://pipeline-messaging-protocol.openci.io/

-K
