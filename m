Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5342C10F14
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 14:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A80821835
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570718514;
	bh=2kVtluJC9B4brEV57M2Zv2NaxYIiCWUZVMR5LEGq+1k=;
	h=Date:From:To:Subject:List-ID:From;
	b=EaGiED8o6Y38GY57Hnziqag7PSs9C/NT1xfi01/dOkJzjFSinFxmPFXJP/OK7Vai7
	 RqpL4eq3us9DUUQ4zBvHjCqogmvf0gE2GdhJxSWHKnDfYO1nKdboVV7XsOh/N8kvM0
	 /SaBj2JHlMeaz39dJZf8mqt7FKbPL0kYoNBjcndg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJJOly (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:41:54 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33362 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfJJOly (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 10:41:54 -0400
Received: by mail-qk1-f193.google.com with SMTP id x134so5859246qkb.0
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition:user-agent;
        bh=KowF+1yjKBWqUIKewWZalEOzLmITnpoJw7deRehzDdw=;
        b=QfW9slUYlOMTXgbGV2RUQWJqPi5CeT2Dn2pSFnwrLXaaiWrc+FYs2SGxoOXItzpbm0
         suhfeIkeHSAGKySIPLFfEVW3ABJNPtncvTnKxY3LzbnetA6LlQgJnwPu5K8IRaIZU0O1
         0xNrkixEm6volXWOL0YaiNhM0V2jIXf47eRXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition:user-agent;
        bh=KowF+1yjKBWqUIKewWZalEOzLmITnpoJw7deRehzDdw=;
        b=jmKdt2V/7VXO5gp0KCYbUAULYczOL+Vj2j/wU2dWFygt1jQ36npWSfoJBGI6ro1kdd
         MpbvmO2rvUDWjQEqdH9RPfXlXVdGOlbYHz7ypdEGHgXSeyZ9BM5mWPwBORgSlRYmcaMs
         hAXDHs8S6fhNQPygHLgAdlMG+01OUSFF2LARZubMRf9vfewvxCoNKbkcAuAcAeqIBD9h
         Ix6YMEcsx1CAlrPxNBZ8iPeDObxrA8UrMxDnfKA4mc3mVP9NNLpjvoDBFvPh6XtoH7Ih
         7sd3VyZ2siyKzocf572Zm+y0TSqrV14sL16vIJV2ARS2ibPCUXhqsTlHajMH/86pdGH3
         7eQw==
X-Gm-Message-State: APjAAAW9XtpFaL8ECe1r6dWHnTVZWjqflLnXXW6V+snF+Eudc++oxD0M
        uIQAQiBZ4efd54oHRFgaozneT6R8j8CFaA==
X-Google-Smtp-Source: APXvYqz+fcU1eL43G7VmGa6IJDv+Ff6PgnQ04wO0dUkcARb6lWOaulN6kQW73aDbKEdFSGKLm9jvlQ==
X-Received: by 2002:a37:7c42:: with SMTP id x63mr10270319qkc.332.1570718512718;
        Thu, 10 Oct 2019 07:41:52 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id s16sm2295889qkg.40.2019.10.10.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 07:41:52 -0700 (PDT)
Date:   Thu, 10 Oct 2019 10:41:50 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: RFE: use patchwork to submit a patch
Message-ID: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
Mail-Followup-To: patchwork@lists.ozlabs.org, workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

I would like to propose a new (large) feature to patchwork with the goal 
to make the process of submitting a patch easier for newbies and people 
generally less familiar with patch-based development. This was discussed 
previously on the workflows list: 
https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/

How I envision this would work:

- user creates an account (which requires a mail confirmation)
- they choose a "submit patch" option from the menu
- the patch submission screen has a succession of screens:

  1. a screen with a single field allowing a user to paste a URL to 
     their fork of the git repository. Once submitted, patchwork does a 
     "git ls-remote" to attempt to get a list of refs and to verify that 
     this is indeed a valid git repository

  2. next screen asks the user to select the ref to work from using the 
     list obtained from the remote. Once submitted, patchwork performs a 
     `git clone --reference` to clone the repository locally using a 
     local fork of the same repo to minimize object transfer. This part 
     requires that:
       a. patchwork project is configured with a path to a local fork, 
          if this feature is enabled for a project
       b. that fork is kept current via some mechanism outside of 
          patchwork (e.g. with grokmirror)
       c. there is some sanity-checking during the clone process to 
          avoid abuse (e.g. a sane timeout, a tmpdir with limited size, 
          etc -- other suggestions welcome)

  3. next screen asks the user to pick a starting commit from the log.  
     Once submitted, patchwork generates the patch from the commit 
     provided to the tip of the branch selected by the user earlier,
     using git format-patch.

  4. next screen asks the user to review the patch to make sure this is 
     what they want to submit. Once confirmed, patchwork performs two 
     admin-defined optional hooks:

       a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
       b. a sanity check hook (e.g. checkpatch.pl)

  5. if sanity checking is defined, next screen shows the output of the 
     sanity check hook, asking confirmation to proceed.

  6. next screen shows the user three fields:

       a. title of the patch/series
       b. cover letter for the patch/series
       c. message-id of the previous patch revision (can be picked from 
          the list of previously submitted series by this user -- 
          patchwork should have them already)
       d. number of the revision (can be auto-filled if previous field 
          is provided) and other tags to include in []

  7. next screen shows final review of what would be sent out to the 
     list (and cc's, if the hook to get cc's is defined and returned any 
     results). Once submitted, patchwork sends the patch/series using 
     patchwork's envelope-from and the user's own email in the From: 
     header.

  8. once sent successfully, cleanups are performed (also needs to be 
     done as part of the regular cron job, for any aborted attempts)

I know this is a pretty big RFE, and I would like to hear your thoughts 
about this. If there is general agreement that this is doable/good idea, 
I may be able to come up with funding for this development as part of 
the overall tooling improvement proposal.

Best regards,
-K
