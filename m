Return-Path: <SRS0=PHiI=XN=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED490C4CEC9
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 08:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA99021907
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 08:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbfIRIFR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Sep 2019 04:05:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:64243 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726814AbfIRIFR (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Sep 2019 04:05:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 01:05:16 -0700
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; 
   d="scan'208";a="181051701"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 01:05:14 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <2608348.dCUkSTB59S@kreacher>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1811089.yxvLMk49Ug@kreacher> <875zlwzbxv.fsf@intel.com> <2608348.dCUkSTB59S@kreacher>
Date:   Wed, 18 Sep 2019 11:05:11 +0300
Message-ID: <878sqmxc5k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 17 Sep 2019, "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> Assuming that git is used to generate patches in the first place.
>
> Some people use different methods, like quilt, however.

Well, perhaps it should be a requirement to use git to contribute to
upstream kernel.

It doesn't prevent you from managing patches with whatever tools you
want locally, go wild, but for contributing you'd have to shove them in
a git tree.

I fully expect this to be shot down as a too radical idea. For the
kernel. It's pretty normal everywhere else. Even though git was
developed for the kernel.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
