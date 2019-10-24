Return-Path: <SRS0=kvgU=YR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E745CA9EAF
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 20:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62E4D21929
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571950687;
	bh=rIpx6gm6Adcr7fQ8n6lEvcAY+Gr35BtIqcvSDrNP5Zw=;
	h=Date:From:To:Subject:List-ID:From;
	b=oRZRosZMbdHjj2L+/FhtUBml713etIWp2iM+RGN6B0vTrku9TDlL7NrMq484H4IZQ
	 u6DtMLyX8h+HF9nju5HURvDA+7+iGz4ZK+mpSaD5VkchPuUjOU371R3uryi7ExI1CJ
	 37mV5Ik/4kjaMLJG6bfHFn22kQ+J2DhZaospvNJY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfJXU6H (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Oct 2019 16:58:07 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:46692 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfJXU6G (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 24 Oct 2019 16:58:06 -0400
Received: by mail-qk1-f169.google.com with SMTP id e66so24760688qkf.13
        for <workflows@vger.kernel.org>; Thu, 24 Oct 2019 13:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=h8+uwMu8eiku5YqLHmAWGHQ/WW+PCgWy6tmdWeBs3dY=;
        b=NMA5S8mFh6ymir+OOHei5V/TQ7q07OAUKMcfz+F/GpNASvTHDW/0DlD9SrRwF9qrQM
         ir1kbiWMj7wnwO4B98cMz7kFd8SU6MoN0iWWzlxwUzc6eDgs9IGFFsXah/s4qr0PA7hs
         ieHOjfjvgFQ/072TFY09Wo6U19M0UxfJIrGd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition:content-transfer-encoding
         :user-agent;
        bh=h8+uwMu8eiku5YqLHmAWGHQ/WW+PCgWy6tmdWeBs3dY=;
        b=LUaKrcGQP8Qvjkaran6QJl1L145mMUyiOM+3iDhdErBdkoZb05ggcTfrSyKOi0yedQ
         TvOnIgeABZFJMo2+nvar8PXdpsyFLvZVhHKURreNtLhQK8KqrUh2cu3bexaJ2IMeFD3J
         WmqkYItFDUfUiT1lhVESVdJKIq/Y9xkb0H7nnfKTgXtWwZKY8QIFdTMoVgYdtbPnP1Br
         NL6S8xv/JqQg/uTv/0dYtstG0W0v9t+KoXNLT370LtYhranhjdQB7ATTTneUziC5DMUI
         b4e2iznOHdlGdgHQ4IV4CThDQPF9PdoqgXaA0ZBd5BhB+WnXF4bP/DbY+4sksDxzwh2c
         95/g==
X-Gm-Message-State: APjAAAWMvhLDO8iRfr12YMYk53YWM7AIr3ToRxXDl2fkVQ0MQz+SBaEl
        mTUd3mfqQzScOsdm4opIow9aT+GFwzI=
X-Google-Smtp-Source: APXvYqwIsni+WOsHw5iJxD8j4ap7luFhxLwVjmWR1jOtGz7wPyF909wMGpVbr0g7iPD+Yq4qegQLbA==
X-Received: by 2002:a37:f90e:: with SMTP id l14mr15778042qkj.68.1571950685486;
        Thu, 24 Oct 2019 13:58:05 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id d55sm18580903qta.41.2019.10.24.13.58.04
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 13:58:04 -0700 (PDT)
Date:   Thu, 24 Oct 2019 16:58:03 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: Tooling and workflows meeting at OSS EU Lyon
Message-ID: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
Mail-Followup-To: workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, everyone:

So, if I read everything correctly, the meeting shall take place at OSS EU
Lyon, on Tuesday, from 14:00 to 15:00. The following people have 
expressed interest in attending:

- Steven Rostedt
- Greg Kroah-Hartman
- Dmitry Vyukov
- Konstantin Ryabitsev
- Christian Brauner
- Laurent Pinchart
- Jon Corbet
- Daniel Vetter
- Nicolas Belouin
- Shuah Khan

(If your name is not on this list but you're planning to attend, please 
follow up.)

I have confirmed that we can use the Developer Lounge, which will 
contain either a whiteboard or a flip chart. Alternatively, if you think 
we should get a dedicated meeting room, we can book one on-site. It's on 
a first-come, first-served basis and it doesn't look like I can book it 
before actually getting there. I will send exact details of the location 
on Monday.

Since we only have an hour, I propose that we focus on a couple of 
topics and perhaps keep them anchored to the immediate future, 
discussing evolutionary changes as opposed to grand schemes that will 
require changing half the known world.

I can discuss any of the following topics at length:

1. Current tools and automation offered at kernel.org, plus new features 
   they are likely to see in the future that are interesting to both 
   developers and maintainers:
    - public-inbox
    - patchwork
    - bugzilla
    - pr-tracker-bot and git-patchwork-bot

2. Proposed enhancements to the email-based workflow
    - cryptographic attestation of patches
    - adding (and requiring) base tree information in submitted patches/series
    - git-to-ML bridges ("turn this pull request into a well-formatted 
      patch series and send it to the right places")

3. CI and bot integration
    - identifying the data that maintainers/developers want to see
    - communicating structured data over email
    - providing consumable feeds of CI/bot jobs (as public-inbox 
      repositories?)
    - avoiding bug duplication
    - recognizing when a bug is fixed and following up on issues that 
      nobody has taken on

4. Maintainer tooling
    - adaptability of existing tools for kernel development, such as:
      - GitHub/GitLab
      - SourceHut
      - Gerrit

    - building on top of public-inbox feeds to create a tool that can:
      - track patches obtained from multiple sources (multiple mailing 
        lists, individual developer feeds, bot activity feeds, etc)
      - collect the usual trailers (Reviewed-By's, etc)
      - show interdiffs
      - send automated templated replies
      - apply series to a local git repository (streamlining "save these 
        patches as an mbox, make a new branch, run git-am")

Unfortunately, that's enough topics to fill a 3-day mini-summit. :) 
Which ones are folks most interested in discussing during the meet-up, 
and which ones should be targeted for hallway discussions?

Regards,
-- 
Konstantin Ryabitsev
Director, IT Core Projects
The Linux Foundation
Montréal, Québec
