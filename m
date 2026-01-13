Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49130F555;
	Tue, 13 Jan 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768328439; cv=none; b=f3mljdw53QV/l1CnW2cOWu2e1q0L8SPm/V4Vg7w5XbPSlwlM3fHqmMZLIGeCdRkAEGpeWNj94cTV8koqP3wRZMz1xCtuNxAaI/RatFfwkF5Ly8bLnuKmjonM2iroBT/j1JnzFeeBOBn1Pz94/N3rwB9E6mwMna2rJoEFr7jyumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768328439; c=relaxed/simple;
	bh=lRM8Y/xkLIw7bSctCujiCXsDVYIm8zBMmGUN2VgohaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9gd3b5FVbEnXbVVD/GTwQz6D+sYKm2lBk5RG5PC36Il0wxeS8MwCx0a0azxnFelLikdB0AgI71qs6XIELEs9dFuZYYmJyDxYIjwnicZJT+41DJ4WWMMwiYStRO0P0XTKXi5X7RLpd8GmqsUcl9fNbnkA/RaWTT9TPTwGJl74CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeDz76AJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeDz76AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768328438; x=1799864438;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lRM8Y/xkLIw7bSctCujiCXsDVYIm8zBMmGUN2VgohaI=;
  b=OeDz76AJQeF43GOlqxTquR2zYvsy4LT02nh9HQX+ubKa1LT4FSogYb//
   FyPg+OfETEQqn51rMNKY87p0tMXktKv2hHa6bDu70d0XsBR0WX/I0du9x
   ZBTcm/gy9bxrncF8O0bDgqtksD22ZMs84j4Jc61fWiFirJyGYMDo0i5/k
   3lH3VkLM7HZx/2NRqvM4cDWwJB2XLLQ467VxNrQjnLdviYhnd/ec7VB7U
   IELZjfKanHcKTaz0dthrSdGafkLO/vuVZa6AHMauqsH/wUrf+o0lZxuO5
   fy0Ql2ccBHkhNCr6tAWt1Z/96s4uqG4JgnZoCALQlfJwJ7UoT9pApD7Pe
   w==;
X-CSE-ConnectionGUID: swrQcdqITW2xj4rCv5Iwnw==
X-CSE-MsgGUID: u7whbevJSQGVicrX6Be56Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72205343"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72205343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:20:33 -0800
X-CSE-ConnectionGUID: 3sqtq0WHRr6twCVVQWS18Q==
X-CSE-MsgGUID: z5W615p5Q22izo7MzUsXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204088946"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.110.187]) ([10.125.110.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:20:31 -0800
Message-ID: <dc516453-9b14-45de-9fd0-a450c068ecb3@intel.com>
Date: Tue, 13 Jan 2026 10:20:31 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated
 content
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
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
 <aWXYi35pu9IHf2eE@stanley.mountain>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aWXYi35pu9IHf2eE@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/12/26 21:30, Dan Carpenter wrote:
>> +If tools permit you to generate a contribution automatically, expect
>> +additional scrutiny in proportion to how much of it was generated.
>> +
>> +As with the output of any tooling, the result may be incorrect or
>> +inappropriate. You are expected to understand and to be able to defend
>> +everything you submit. If you are unable to do so, then do not submit
>> +the resulting changes.
>> +
>> +If you do so anyway, maintainers are entitled to reject your series
>> +without detailed review.
> Argh... Flip.  In context, that sounds even more sinister and
> threatening than my over the top proposal.  We have to "defend"
> everything?  "If you do so anyway" sounds like we're jumping to a
> "per my last email" from the get go.  What about:
> 
> If tools permit you to generate a contribution automatically, expect
> additional scrutiny in proportion to how much of it was generated.
> 
> Every kernel patch needs careful review from multiple people.  Please,
> don't start the public review process until after you have carefully
> reviewed the patches yourself.  If you don't have the necessary
> expertise to review kernel code, consider asking for help first before
> sending them to the main list.
> 
> Ideally, patches would be tested but we understand that that's not
> always possible.  Be transparent about how confident we can be that the
> changes don't introduce new problems and how they have been tested.
> 
> Bug reports especially are very welcome.  Bug reports are more likely
> to be dealt with if they can be tied to the individual commit which
> introduced them.  With new kinds of warnings, it is better to send
> a few at a time at the start to see if they are a real issue or how
> they can be improved.

Hey Dan,

I agree with most of what you wrote here in general. My only issue with
it is that it seems to be good, generic advice and isn't specific to
tooling-generated contributions.

For instance, this suggests saying:

	"Ideally, patches would be tested..."

Testing is covered in Documentation/process/submit-checklist.rst and in
a few other places. The thing that I do think belongs in this document
(and is missing in v5) is a note that maintainers might expect *extra*
testing from tool-generated content. I've added a blurb like that to my
working v6 version.

Are there other things that are missing and truly specific to
tooling-generated contributions that aren't covered in other documentation?
