Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647E30CDB1;
	Tue, 13 Jan 2026 18:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768327521; cv=none; b=jmrFHP7HerkkXwZUaBmBay+YK9GjFXLYEeAkC1VuTmrux1lcdufnCj3aq4kCWciE5EwuZCG2trDF3q/l87MZrvnro8JLBqBzai48fzkTpek+SyoFGkfd+yrQd7eBPOTrUugkckxn7dRK0NL5KXI7o6LWYKRYRZ5zufHUna+Fq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768327521; c=relaxed/simple;
	bh=ClYrpZWBbGq5iJVIXGRc49iKOj0sZJMbx6hlHRhL1cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Weyospu4HyrvIX75S4NJMCP+ZV1pU7p9C/1heiCn8GVuxIqZzaploNRhTz2k8KW2NBTNDjv7/zf5z7riilIqTrM3Iryp2+f88KtATwHRUKe63kemRjO7A2eSlSehTd+FklN1/jwKJuXSns7crwdJlMwUE0Ga2YIo92EgH4pwYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtoyWb2o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtoyWb2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768327519; x=1799863519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ClYrpZWBbGq5iJVIXGRc49iKOj0sZJMbx6hlHRhL1cc=;
  b=GtoyWb2oIJf4ilF0H/OsTgpruKWhqV8418YZInHY1JH0b/bcndcFwwMc
   fzq6BRhsurUF/HFIjCJVQrARrpNCYF6gBSFmZAUTRVVfWVvpq0+sPqI43
   F+tUFT7VVfBO4OiT35QUVvv0X4sGFj/T5vJT+XljkE41+klPXE363Sp3X
   +Gcg5Tl9zcGvWEu44Qq90Xf9be11y7Y9MytbZmMwrV/XNlMeW6n+W/P8L
   YuO2Zqt5rmN90yicgN6kgStNqN3DNKnHQt0RJ8B5BPLayYACbKSXClVty
   AemajDCoHoB896yzmrOCw2ZWz4P44Js7j6C4zSn7n5HkJ0V83Qhu5B0qW
   w==;
X-CSE-ConnectionGUID: gFd7j9DGT6uS5kRek1Jq4Q==
X-CSE-MsgGUID: q1l5EpsxSOmPuLlZlp1fIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69530820"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69530820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:05:18 -0800
X-CSE-ConnectionGUID: sMXJTNsYRselwu4XrA2HRw==
X-CSE-MsgGUID: xMK7CBQxTFGCdJCxmiH/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208608030"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.110.187]) ([10.125.110.187])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:05:18 -0800
Message-ID: <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
Date: Tue, 13 Jan 2026 10:05:17 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated
 content
To: Lee Jones <lee@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Steven Rostedt
 <rostedt@goodmis.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Simon Glass <simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <20260113103609.GA1902656@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260113103609.GA1902656@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/13/26 02:36, Lee Jones wrote:
...
>> +Even if your tool use is out of scope, you should still always consider
>> +if it would help reviewing your contribution if the reviewer knows
>> +about the tool that you used.
> 
> Parsing ... okay, that took a few goes.  How about:
> 
>   Even if disclosure of your tool isn't mandated, providing this context
>   often helps reviewers evaluate your contribution more effectively.
>   Clear documentation of your workflow ensures a faster review with less
>   contention.
I agree that the sentence is hard to parse. But, I want to explicitly
say "out of scope" to tie this in to the rest of the section. How about
this?

	Even if your tool use is out of scope, consider disclosing how
	you used the tool. Clear documentation of your workflow often
	helps reviewers do their jobs more efficiently.

BTW, I do think we're well into diminishing returns territory. I'll roll
this into a v6 if there's a v6. But, if it's pulled in as-is, I think
the original can stay without causing too much harm.

...>> +Some examples:
>> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
>> + - Coccinelle scripts
>> + - A chatbot generated a new function in your patch to sort list entries.
>> + - A .c file in the patch was originally generated by a coding
>> +   assistant but cleaned up by hand.
>> + - The changelog was generated by handing the patch to a generative AI
>> +   tool and asking it to write the changelog.
>> + - The changelog was translated from another language.
> 
> Nit: Suggest removing the sporadic use of full-stops (periods) across all lists.
> 
> Or add them everywhere - so long as it's consistent.

The rule that I read is that when the bullets are full, complete
sentences, you should use periods. When they are just nouns or shards of
sentences, leave off the periods.

I _think_ that's the consensus for how to punctuate bulleted list items.

But I don't remember where I read that, if it was in Documentation/
somewhere or it was some random rule on the Internet I decided to apply.
