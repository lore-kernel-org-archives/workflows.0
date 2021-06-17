Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89FCC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 22:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB5D613BA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 22:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbhFQWhY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 18:37:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232482AbhFQWhY (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 18:37:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 829EE61351;
        Thu, 17 Jun 2021 22:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623969316;
        bh=2IZAQIGpGHXdGVjFfGbTKJw8lRbmPgnQVXBUcO/ynBA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=BmofRq7L4k/USO5wIIsJZyKmUzJqMctkHMZxQAFreJckB/idLjgTXfMImRgWfE9rj
         Zrtd5K7jytM2tmZdUtvvPcTyuql8TxPg9a6mxTH1v2O1d6JDsF5W5DLI7pFxjcKyMi
         HBG92Zom6FDM5lvjC/1J0edGfDVmCot3gsjzQ8yLXUzTZ6dl5l06ydsWgxlveLth98
         cnp5MFwRbyZD4I33FLFpNXsAaj5fthwlqXzdJ6lIGmq8TjaQt+wkj2jmZaEF/nv9wh
         z9LCasCY/kU4tFLr/CN+KwOJsmSu8wCMYplCVg2QlhexEavAb4u5n8ERAlAKuAzpID
         cjNZGRUZFjxoA==
Date:   Fri, 18 Jun 2021 00:35:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stefano Stabellini <sstabellini@kernel.org>
cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
In-Reply-To: <alpine.DEB.2.21.2106170954410.24906@sstabellini-ThinkPad-T480s>
Message-ID: <nycvar.YFH.7.76.2106180028280.18969@cbobk.fhfr.pm>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org> <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm> <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com> <YMsfXuykH6z0ZbpM@infradead.org>
 <20210617145728.nahkvtxapozccm6c@nitro.local> <20210617151659.GF5067@sirena.org.uk> <b675c075-19e8-11ef-3174-49eb6975be6d@redhat.com> <alpine.DEB.2.21.2106170954410.24906@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 17 Jun 2021, Stefano Stabellini wrote:

> But newcomers often complain that it is too difficult to configure their
> company email to work with git send-email and the LKML. Things such as:
> 
> - the company only offers Outlook as a client
> - the company automatically adds the annoying disclaimer at the end of
>   every email ("IMPORTANT NOTICE: The contents of this email and any
>   attachments are confidential and may also be privileged...")

AFAIK Linux Foundation is currently in the process of setting up a 
@linux.dev e-mail domain for kernel developers (hosted by migadu.com) that 
doesn't suffer from any of the above.

So either the employer wants to be recognized in the commit / LKML 
messages, and they are able to get their mail systems to behave [1], or 
they are not, and then people will eventually be able to use LF-provided 
@linux.dev address, and cast an indirect public shame on their employer by 
doing so :)

[1] @linux.intel.com, @linux.ibm.com, @suse.[de,cz], you name it .. that's 
    exactly the reason for existence of those email domains

-- 
Jiri Kosina
SUSE Labs

