Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE2C49ED7
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 11:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8966208C2
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 11:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbfIMLNX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 07:13:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:4192 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729575AbfIMLNX (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 13 Sep 2019 07:13:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 04:13:22 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="179648268"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 04:13:19 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <1811089.yxvLMk49Ug@kreacher>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1811089.yxvLMk49Ug@kreacher>
Date:   Fri, 13 Sep 2019 14:13:16 +0300
Message-ID: <875zlwzbxv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 13 Sep 2019, "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> Hi All,
>
> During the Maintainers Summit session yesterday I started to create a wish list
> for the new kernel development collaboration platform to be created (and to
> replace the multiple pieces of tooling in use today).  I also asked Bjorn,
> Jiri, Greg and Shuah for input and here's the reslut:
>
> 1. Compatible with e-mail
>
>   (a) E-mail send to it stored and included automatically; appears as part of
>       the normal flow.
>
>   (b) Automatic e-mail responses
>       If e-mail is sent to it, the sender will get all responses to it in the
>       given thread by e-mail.
>
> 2. History tracking
>
>   (a) Should be able to track revisions of a given patch series (or patch) down
>       to the initial submission.
>
> 3. Integration with git
>
>   (a) Should be able to create git commits from patches (or patch series)
>       tracked by it if pointed to a git branch (either locally or remotely).

As I wrote in [1], I think git send-email and am are a lossy method of
transmission, and reliably regenerating commits from patches, with the
right baselines, as well as tracking various patch and patch series
versions, is very difficult.

I think we should have a git push based mechanism to contribute, which
would in turn send the patches to the right lists and maintainers for
review. Maintainers could, at their choosing, still use the emailed
patches (which would all be sent using the same pipeline, without the
typical issues) and their exact existing workflows, or switch to using
the commits from a branch directly.

There are more contributors than maintainers by several orders of
magnitude. It would make the maintainers' lives so much easier if the
patches came in the same way, every time. When we have technical issues
with patches, as maintainers, the problems rarely are in the receiving
end. IMO solving *all* the other items in this email would become much
easier if had this first.

BR,
Jani.


[1] http://lore.kernel.org/r/87lfv3w3v6.fsf@intel.com


>
>   (b) Link tags pointing back to it should be added automatically to git
>       commits created from patches tracked by it.
>
> 4. Distributed
>
>   (a) Support for running offline.
>
>   (b) Support for batch updates.
>
>   (c) CL-frendly.
>
> 5. Patchwork-like features
>
>   (a) Delegation support.
>
>   (b) Support for bundles and patch series manipulation.
>
>   (c) Smart mbox (download all selected patches).
>
> 6. Easy to set up (especially for local installations)
>
> 7. Bug tracking support
>
> I guess there are more items to be added to this list, so please extend it if
> you have any ideas and we'll see where this goes. :-)
>
> Cheers,
> Rafael
>
>
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
