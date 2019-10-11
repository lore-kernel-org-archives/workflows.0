Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B54C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81BE22089F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570820398;
	bh=3jXlt41X2G7uTGZZzPUU//dmtk7Phlhf51M7zrQdjk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=GekM1Y/sysaMzSBDSqlhvCXvC0AyY5xRwVNGuq6ZW/+7ZUxPbRxqpSls9lp4uavQ/
	 HkraySHUQD8gTuyQO0OzFVKeHO6rf5gaWfMVLUjP6wD7NQ3Izd8eZeAv5X9Jh/HheM
	 pKUZsVykbbEpeIBHSC9HzgnEdnywMsI8CeMk5v6o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfJKS76 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:59:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57224 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbfJKS76 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 14:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cwfBiQ5ctI3mkVjjtCxRFp3Nln/rZMSEm2zX78VVX0Q=; b=VLuHeuXbfvGdGVmLfLg3ODxTp
        0NIWeuZCuK29JfiRMjAB3sZFCQqOL3EeOVqtOB1c7lTndyphzM+3MxG/XksFscw1y/ehxiBlnNsva
        ah4JEUox884fTXyByJehoBtWDeLaS2obOeWBSyN4lrU98eY3rocYGjo4Me+wiVGHeWTIFOM223Ch0
        O6yqlk+PTB1yjyWIOIYto08BcbKvbulT0phxc7oL3TfZE5cTg0N/uQeTaDI1MuFoByPiT/SIkuY7+
        3NEKJBJEq89hncAMv+9pOxk/tNpUY2ZJ2UlusnK8wNxNMozoF609JTLIn3olEVIjSqwLVTOhYfzOo
        yqNuJ8a4g==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJ08n-000627-5w; Fri, 11 Oct 2019 18:59:53 +0000
Date:   Fri, 11 Oct 2019 15:59:49 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     David Miller <davem@davemloft.net>
Cc:     rostedt@goodmis.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011155949.145f0f7d@coco.lan>
In-Reply-To: <20191011.113254.1964556815296845399.davem@davemloft.net>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <20191011143744.4291b42d@coco.lan>
        <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Fri, 11 Oct 2019 11:32:54 -0700 (PDT)
David Miller <davem@davemloft.net> escreveu:

> From: Steven Rostedt <rostedt@goodmis.org>
> Date: Fri, 11 Oct 2019 14:01:08 -0400
> 
> > Thus, if we want people to send us their fixes, we better keep just
> > an email with a patch the lowest bar for entry.  
> 
> I argue that for people coming into the software engineering world
> today, a PR is the lowest bar for entry.  And email is the exact
> opposite, _especially_ our way of doing email.
> 
> Because it IS NOT just an email with a patch.
> 
> It is an email with a specific Subject line format, with various
> fields.  Some field are optional and some are mandatory, and it also
> depends upon which tree you are targetting.
> 
> Then there is the commit message which has content and formatting
> requirements.
> 
> And then there are the tags, of various types and flavors, and the
> context (which is sometimes subtle) determines which of those tags are
> relevant and how they should be filled in.
> 
> The various other standard email fields like TO: and CC: have to
> be set a certain way otherwise the patch won't even be looked at.

I can't see how just adding a web interface like github/gitlab
would solve any of the above. I mean, the submitter will still
need to write a proper subject/description before submitting the
patch to the web interface, add the tags, etc. 

The only thing that would be different if we write a a Kernel-specific
web GUI would be to automate some sanity checks on it, like starting a CI
build for the patch series, run checkpatch and get_maintainers, but that 
could also happen if we write a script/submit_patches tool, that would
internally call checkpatch, get_maintainers and git send e-mail
(or use some other interface like patchwork REST to submit patches).

Thanks,
Mauro
