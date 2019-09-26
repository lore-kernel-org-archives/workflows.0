Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FEDC4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 14:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C652222C7
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 14:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfIZOka (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 10:40:30 -0400
Received: from mga18.intel.com ([134.134.136.126]:48766 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbfIZOka (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 26 Sep 2019 10:40:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 07:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; 
   d="scan'208";a="203867160"
Received: from duerm-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.103])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 07:40:26 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <CAMuHMdU73rjaxTwxNaUY9t2LrGsSEJpX4Hz=3AJ2kwbgMYOPoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu> <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com> <87muergq3m.fsf@intel.com> <CAMuHMdU73rjaxTwxNaUY9t2LrGsSEJpX4Hz=3AJ2kwbgMYOPoA@mail.gmail.com>
Date:   Thu, 26 Sep 2019 17:40:35 +0300
Message-ID: <87k19vgly4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 26 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Thu, Sep 26, 2019 at 3:10 PM Jani Nikula <jani.nikula@intel.com> wrote:
>> On Thu, 26 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> >   - Quoting a 2000-line patch when commenting on a single line deep down.
>>
>> I've actually become almost completely immune to that because my mail
>> client collapses long quotes by default, thus highlighting the replies.
>
> The Gmail web interface is indeed good at that... Until you want to rebuke
> a review comment, and have to go digging...

Who said anything about gmail? https://notmuchmail.org/ ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
