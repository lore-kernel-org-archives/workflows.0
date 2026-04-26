Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E840DFD5;
	Sun, 26 Apr 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777202622; cv=none; b=nBLQVOp7Hj2e97yDTlx8/hqBTJqtcNKMogpc+CwDtAO1QASHBaI8J0gaH6CFVAs9M9g4YKTCpowqeCii9JX2+QY+IarmMXsNjGADFluRYCLSZZfINkhpkH++49nbcegzLt52NKpwCVXJzl0u7CUtF0GWoOJWgBhNKzlYf+eYOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777202622; c=relaxed/simple;
	bh=DGvehEq54IMbZLtde2Rjsx6Hc9dnpi1SOR/oYcsq62s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClvGrlDgu9xE7xVC1JVTvijq79O1Sy3l98rJBxmwqCGc4uhYWXSqvNuChwb46xtKcjvZXOYl+YJUUc5HCltQ+ce9elaFEVNkkzCODVXimsMMFU5u8OKaRwUjsxVu7PcsGQbw4Go4WzyX0OjJWntLx9iVp7sEc+jhFOYU1WpI4pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4F3TzZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4F3TzZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E264CC2BCAF;
	Sun, 26 Apr 2026 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777202622;
	bh=DGvehEq54IMbZLtde2Rjsx6Hc9dnpi1SOR/oYcsq62s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4F3TzZM5j1Nzw4YQRcvKhC8mni8FU3aZ7h3UgAmY1C50RzTHNtzSp24kPKVHxizM
	 V/U+k7pIR6LWhcPgOGesH6/hntk8DY/4q2xRK14HnsGBfCoWQikyPJlzchTZ8tB7Sh
	 DE4MHbq2axnqGpdPBhTpIZq7lHk5re1hVFmrNkktr0zOHfpkr19z57StGERkXtNOso
	 iyu5WDCystkZinb3HKo0B2uaobpH+MmiWWGGjGYixvP9fEy0pOrulAdr5Ce/1lzib/
	 x8PUONfwtYR03cadSZJCU2kWc9tIkrtIYQPPPNZNw5srPywcdO2CMp7uOpgp01Dgp/
	 R7vddL/7MyPdA==
Date: Sun, 26 Apr 2026 07:23:40 -0400
From: Sasha Levin <sashal@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, mricon@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] checkpatch: add --json output mode
Message-ID: <ae31vGWp-t8GiAHs@laps>
References: <20260408172435.1268067-1-sashal@kernel.org>
 <20260425200431.4088895-1-sashal@kernel.org>
 <c8722587377c3bc4be03f7d04bd45912@perches.com>
 <ae1XUFURKgdG6lGh@laps>
 <1f8e71e117fbe7ff43723a863fd598c0568c4938.camel@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f8e71e117fbe7ff43723a863fd598c0568c4938.camel@perches.com>

On Sat, Apr 25, 2026 at 06:12:13PM -0700, Joe Perches wrote:
>On Sat, 2026-04-25 at 20:07 -0400, Sasha Levin wrote:
>> On Sat, Apr 25, 2026 at 02:52:35PM -0700, Joe Perches wrote:
>> On 2026-04-25 13:04, Sasha Levin wrote:
>> Add a --json flag to checkpatch.pl that emits structured JSON output,
>> > > making results machine-parseable for CI systems, IDE integrations, and
>> > > AI-assisted code review tools.
>> > []
>> > > A separate --json-pretty flag emits the same JSON in a pretty-printed
>> > > (indented, multi-line) form for human reading
>> > Why not just always use pretty?
>> > Would a script care?
>>
>> Who's the intended consumer for the --json-pretty?
>>
>> I my mind, --json is there to make it easier for tooling to process the output.
>
>Agree, but does the pretty output make it harder for tooling?

For real JSON parsers, no - they handle either form fine.
                                                                                                                                                                           
The one issue is multi-file invocations: --json emits one compact document per
file per line (NDJSON), which lets plain-shell consumers do `while read line;
do ...` or pipe through grep/awk/head. Pretty mode loses that property because
each document spans multiple lines, so consumers need a
streaming JSON parser.

-- 
Thanks,
Sasha
