Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B06C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 21:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6A2321A4C
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 21:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569878654;
	bh=2a8sEC0KmLOofOR/KmXczBckB9a5kqxAqx9TpHSiZfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UMv5QG0oABOvyq8C5XNUIZLPxCPa1V+vDsiwMguQWun17MGh0FgJl1Tt/PT8j9uoc
	 8D0nMWFLOBEIFRtvOtrG5uj5nj6WZ0cGjw7OYUcgJxWK8vCquCrk7mrzfVIPycZMde
	 eJjeF8A8Z0hauGHDI4DP2B8WbUIwuyQrQwq+1FI8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731949AbfI3VYO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 17:24:14 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39934 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731703AbfI3VYO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 17:24:14 -0400
Received: by mail-qt1-f196.google.com with SMTP id n7so18947725qtb.6
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2a8sEC0KmLOofOR/KmXczBckB9a5kqxAqx9TpHSiZfc=;
        b=XlKzxVNU06r0BbfUWYYjDxmLyDoAzPgulcpGcjH1fkd5eyGkhsQ6FpuDGWs+O7O49T
         NmfC/uKEsn5soFcOfnijm//i+TiQ8XPKy6MNYp4wwDfrarx9NNHqQvMnv2OByCynYf3u
         DecexrvOgamwHRcWYKkfRPmr2Tf109lJhmoKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2a8sEC0KmLOofOR/KmXczBckB9a5kqxAqx9TpHSiZfc=;
        b=axmJ0qfzKQgIPw2QxEYRrqQnbikZbz/ujRh+cnqLqG5Vmym2lqpk450unsdIneHSTS
         l0pBERH7U2Gea1exxHNVBY4iQkPh+Yt4bpWUSF6HshKHjfILTWmPg/pzR9WaSMz1ni8p
         A1Gp+lXFJkYi+gwH+ZblaKWOL4btz2Ldra7qWEhFlfQOiXjXARG7+t4+xdmS76BPlEBr
         JpytBp/e5YmQcE4Uae2t56EI047TnL738S+SNv2sWt4m3DWgNh/NfPyRjkJ1kBNgnxyP
         Ro6Tuc5flQz5KzhID012SLzKhslSjWj2K0Zp7JiiceCVcnU2byoCKJ9BFuXvgygpaQrh
         pYbg==
X-Gm-Message-State: APjAAAXuuzF5mSjR88oHbVO2NL7nERDUdwkc+IBIm7vZkNkZpwpa57bZ
        8xEwCYCq5Tm1Aie5y/rvK64YZQSfqxtvPwkQ
X-Google-Smtp-Source: APXvYqyN2glVmWaNCl4qwwFv62ADu1gIzNjsiyCxBYRncN93yfHISTBV3jwCPgE577G9BZ4FEURzFg==
X-Received: by 2002:ac8:5344:: with SMTP id d4mr27128383qto.258.1569878653021;
        Mon, 30 Sep 2019 14:24:13 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id x19sm6065914qkf.26.2019.09.30.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 14:24:12 -0700 (PDT)
Date:   Mon, 30 Sep 2019 17:24:10 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>,
        ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] Reflections on kernel
 development processes
Message-ID: <20190930212410.GE14403@pure.paranoia.local>
Mail-Followup-To: Daniel Borkmann <daniel@iogearbox.net>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <610c62f2-f2e4-2eb1-3051-53c573194f52@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <610c62f2-f2e4-2eb1-3051-53c573194f52@iogearbox.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Sep 23, 2019 at 02:52:01PM +0200, Daniel Borkmann wrote:
> > Most (all) of the "kit" functionality should be separated from the UI
> > and be available for scripting/automation/other UIs. Whether it's
> > done as "libgit" or as "shell out" is discussable.
> [...]
> On that note, such a tool would also need to co-exist with the current
> email based process for some (long?) time in order to allow a smooth
> transition period. Last week I spent a few of nights hacking a small tool
> which is regularly pulling the lore git trees I'm interested in and checking
> out all [new] mails into maildir format so they can be read naturally by
> UIs like mutt et al [0]. As an experiment, in case of bpf vger mailing list,
> it extracts all current ~8k mails in under a second:

Thanks for working on this -- I've started on a similar tool in the
past, but got distracted and never completed it. In my implementation,
it was piping messages to procmail, which allowed writing complex rules
for folders/pre-processing, etc. May I suggest that your tool also
offers a stdout that can be piped to procmail?

-K
