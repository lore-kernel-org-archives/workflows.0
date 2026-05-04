Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD9222580;
	Mon,  4 May 2026 06:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777875830; cv=none; b=fqxT4lqzDMp5tr6DrxRUThiUBkhG8N9M7w/KfOd0TTZtb+KvWQOMpl48tDkC2w3wizbIzc4xGwTA2hQPm6Rz2+bl+1yErtPXMLGa9NQChO5hy4faY0HcQmUInqAsE0M0L2OA1+FtiJPjBssmZRYSxqxuyr1CfKehc3lPzE0dYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777875830; c=relaxed/simple;
	bh=TDTWbGjZHeBypK0OdfBWxU6ynsnJ8OcFJG2kDjwebzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+92Jo+jApSMVWTK/Uv1CVZEI5Z1ZTZU4E5j3XYMeI4x3sttywtRgy5Rjh+cpVKBVoSWyEszXgRHNmeGlasBaM0o+4RqAYNbRSP8Aia4aJnm1Dz5b+cKH+FEIsJA/TkD/RlJwUsQ68p4JT26lWc12CB+AiLMOLJTuEyjR23wlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b7o4WGPQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bien55xk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b7o4WGPQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bien55xk"
Date: Mon, 4 May 2026 08:23:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777875826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KOIYNhhxlhdcRK869KmnnV/MUk9D3C0X4K2x8J2muk=;
	b=b7o4WGPQGm+EyxlTM1kIcrwvWS4R1DpY/pY7At2r1x4ZIM2BuD7rtwEOU7nv7uxGsTp3nC
	GNvZrJI9IHlwPDy48rG0UIRr1sXYr6/aaURV4vKWeYbLvqi7jO4LOURJzrIn2xLCQVPdpV
	16e1xqy6+CqzPrbTgt/i1X2ztD/G0+jUtnM4TS6VkdhMobda5hxXRlAE2x0940i0DdsNu7
	ALgGm8gjn5vEvA7o+PeBdFkWwgrTnCufSNeHWlVy9mfHzMtHhGgVUOTrldS83aL9LCrs4f
	J0HC8dCy3C2LjbVzttrykaf8epAiPYYXUA4EhEZQU8k8VEWy1uutovuA+IShew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777875826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4KOIYNhhxlhdcRK869KmnnV/MUk9D3C0X4K2x8J2muk=;
	b=bien55xkJb+vMrjvmzMpTHiDQV56FXmlfrczSnc0t7m1wC3w5CgJ4frXJoC3vld9WyKUUU
	nuPFbmczUFz8RjAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v2] kunit: tool: Add (primitive) support for outputting
 JUnit XML
Message-ID: <20260504081256-2f65d9ea-adf4-4949-a758-282f9e76a871@linutronix.de>
References: <20260502024918.1056954-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502024918.1056954-1-david@davidgow.net>

Hi David,

On Sat, May 02, 2026 at 10:49:17AM +0800, David Gow wrote:
> This is used by things like Jenkins and other CI systems, which can
> pretty-print the test output and potentially provide test-level comparisons
> between runs.
> 
> The implementation here is pretty basic: it only provides the raw results,
> split into tests and test suites, and doesn't provide any overall metadata.
> However, CI systems like Jenkins can injest it and it is already useful.

"ingest"?

> Signed-off-by: David Gow <david@davidgow.net>
> ---
> 
> Finally got around to doing a new version of this. I'm running this
> locally with Jenkins, and it's giving nice summaries of test results.
> 
> Changes since v1:
> https://lore.kernel.org/all/20260119073426.1952867-1-davidgow@google.com/
> - Use python's provided XML quote escaping, rather than coding our own (Thanks Thomas)

What I tried to suggest was to do all of the XML generation through the Python
module instead of manual string concatenation. The XML escaping would go away
as a side effect.

A pseudo-code example:

out = xml.sax.saxutils.XMLGenerator(f, encoding='utf-8')
out.startDocument()

for subtest in test.subtests:
    out.startElement('testcase', {'name': 'subtest.name' })

    if subtest.status == TestStatus.FAILURE:
        out.startElement('failure', {})
        out.characters('Test failed')
        out.endElement('failure')

    out.endElement('testcase')

How I used it recently:
https://github.com/Linutronix/elbe/blob/master/website/ext/elbedocoverview.py#L133

> - Output proper <skipped> tags for skipped tests
> - Report crashed tests as <error>
> - Don't output <system-out> tags if there are no lines of log data
> 
> ---
>  Documentation/dev-tools/kunit/run_wrapper.rst |  3 ++
>  tools/testing/kunit/kunit.py                  | 25 ++++++++++-
>  tools/testing/kunit/kunit_junit.py            | 43 +++++++++++++++++++
>  tools/testing/kunit/kunit_tool_test.py        | 38 ++++++++++++++--
>  4 files changed, 105 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/kunit/kunit_junit.py
> 
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
> index 770bb09a475a..cecc110a3399 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -324,6 +324,9 @@ command line arguments:
>  - ``--json``: If set, stores the test results in a JSON format and prints to `stdout` or
>    saves to a file if a filename is specified.
>  
> +- ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
> +  saves to a file if a filename is specified.
> +
>  - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
>    Multiple filters can be used by wrapping input in quotes and separating filters
>    by commas. Example: ``--filter "speed>slow, module=example"``.
> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
> index 742f5c555666..1a7ff594b791 100755
> --- a/tools/testing/kunit/kunit.py
> +++ b/tools/testing/kunit/kunit.py
> @@ -21,6 +21,7 @@ from enum import Enum, auto
>  from typing import Iterable, List, Optional, Sequence, Tuple
>  
>  import kunit_json
> +import kunit_junit
>  import kunit_kernel
>  import kunit_parser
>  from kunit_printer import stdout, null_printer
> @@ -49,6 +50,7 @@ class KunitBuildRequest(KunitConfigRequest):
>  class KunitParseRequest:
>  	raw_output: Optional[str]
>  	json: Optional[str]
> +	junit: Optional[str]
>  	summary: bool
>  	failed: bool
>  
> @@ -268,6 +270,17 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
>  			stdout.print_with_timestamp("Test results stored in %s" %
>  				os.path.abspath(request.json))
>  
> +	if request.junit:
> +		junit_str = kunit_junit.get_junit_result(
> +					test=test)

Unnecessary linebreak?

> +		if request.junit == 'stdout':
> +			print(junit_str)
> +		else:
> +			with open(request.junit, 'w') as f:
> +				f.write(junit_str)
> +			stdout.print_with_timestamp("Test results stored in %s" %
> +				os.path.abspath(request.junit))

f-string?

> +
>  	if test.status != kunit_parser.TestStatus.SUCCESS:
>  		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
>  
> @@ -309,6 +322,7 @@ def run_tests(linux: kunit_kernel.LinuxSourceTree,
>  # So we hackily automatically rewrite --json => --json=stdout
>  pseudo_bool_flag_defaults = {
>  		'--json': 'stdout',
> +		'--junit': 'stdout',
>  		'--raw_output': 'kunit',
>  }

(...)

But all of it are just suggestions.


Thomas
