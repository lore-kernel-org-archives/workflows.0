Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB078685
	for <workflows@vger.kernel.org>; Thu,  6 Jun 2024 06:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656204; cv=none; b=eRbTcvnnIAwy4V4f9AP2X+M34TSGZW26jt2Du9k8mFBuimQEoV2ptvRDSqP25JUTC4Be59ptrviTscYnaPNa9nma563AAan5KryMnqs5EObZQnwhL2klBw4sWEk/ySVNgK2w1P1DFX6ilAdXYkKu6aaPTrF9Yxs8dxJ3epQCRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656204; c=relaxed/simple;
	bh=dRNutEV6Irzt0DuSYxtF3OmJPSVdRGj+rXxKF2Yers4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ua38aZ4KWg0tXXwzl9xoeClpa59ZuKVPPIaQz6TvhT32d/fftBuRWj9cioVnQ1nGYcp+jOCibI4qM3GgQAtm75i9IqE9DSqBg/IChO+iqkBAHzPncYeR7tzUMUMJxtwKadaUBL+ZbORsrNJ5TaJA2Qezr3HXMZD6cRigjWR+Zbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EWfcv31u; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EWfcv31u"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so6842961fa.1
        for <workflows@vger.kernel.org>; Wed, 05 Jun 2024 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717656201; x=1718261001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHyc1Tt3pV1FQtb9e1735Ph8tUakhCj1D2RUXjVww7w=;
        b=EWfcv31ujQG+2Z8kIPY8ZXJpO7H0eRco60b90p0+RjsI3xBPnJxpa3tzZGppxSvkzm
         7YjVi8i9zdAqlleSjt6idMdy7KIkOPmIol5HG26M5xa9Bj30eWLvyP8C1IoxZ4I9xZ8W
         7VMFOgStFDXmMnTX8Cwoik9kv0CI5gecQVAmWWTspK9YPnMYvw9UqjCxW9gwqT80C2WY
         PzIx6XoOeN6/BocRHq/WwAtrdPq0D6oqeJEZzo6W4pB4pNypiSVjkq2U7paicbeYWDhL
         deYfH7x4khJC3aE+hCQvnQY7qo7OrgfuW9m895A3fLRJx04uIFGb0GuG0tACvRMQTecv
         Zuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656201; x=1718261001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHyc1Tt3pV1FQtb9e1735Ph8tUakhCj1D2RUXjVww7w=;
        b=vx/WwgOGKFuPMhNRyRBgF9nQAsTKuJVZYCNKAMLvoTXFKabMDA4RSneOWlU14z0HGH
         oKbDwY0BkVv5HouK5eCUn10/20NlrGE1P13Pf/PnoTRqTnaPAWr1CJ4yU6I0B19X9xL5
         VxQfpKC/OdM9qjDthC7byChuNq4Y0MlSZNz0b/PCDMZIZIsPKnBJ1tmC9bpjPEuPqLVP
         sNNScPwpb1qrltOaFZ92njJx9vcb/GgBRilRG5bP8oOlaxpdE+tlHfNgpRkCL1a4Zyg5
         L3FUHzW30koTMlrE8zCpbm0jnb70nvKsbh+kOSo4Kbgoz6Z8Cza4+4aTf/oSHNA9lxxl
         k/YA==
X-Forwarded-Encrypted: i=1; AJvYcCX5l0H97F+rdItNiOkxjQwHrliCtOk9zCAQ5yflqTn8RfNN86hmyZ/6Z5qVphsBE5d09nDHVF+8zT2SzuqqJdJoohqi34OEKycz
X-Gm-Message-State: AOJu0Yx7TE8SBXr+WUZmG5E/REppzV2TyKxq9VxlWPdCsR26+o8dSXUe
	yUPOWGtKPfsKMqnkTNNiuIMMwpYAZejXcZDRidg1vfpDl6FS6bHkpG79B947/wg=
X-Google-Smtp-Source: AGHT+IGAEevHPMa1Q4hJfThfhSVeLwcacpZB+ndTosr+5ZZ71YchIkHJHegUKocqZHRkD83kPgRVCA==
X-Received: by 2002:a2e:8ed4:0:b0:2ea:7f57:5a74 with SMTP id 38308e7fff4ca-2eac7a6c3ccmr25251421fa.42.1717656200730;
        Wed, 05 Jun 2024 23:43:20 -0700 (PDT)
Received: from localhost ([2401:e180:8882:8af3:26fa:edbd:5679:640c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd8136easm6473025ad.278.2024.06.05.23.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:43:20 -0700 (PDT)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	stable@vger.kernel.org,
	workflows@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH 1/2] docs: stable-kernel-rules: provide example of specifying target series
Date: Thu,  6 Jun 2024 14:43:08 +0800
Message-ID: <20240606064311.18678-1-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a concrete example of how to specify what stable series should
be targeted for change inclusion. Looking around on the stable mailing
list this seems like a common practice already, so let's mention that in
the documentation as well (but worded so it is not interpreted as the
only way to do so).

Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
 Documentation/process/stable-kernel-rules.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index edf90bbe30f4..daa542988095 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -57,10 +57,13 @@ options for cases where a mainlined patch needs adjustments to apply in older
 series (for example due to API changes).
 
 When using option 2 or 3 you can ask for your change to be included in specific
-stable series. When doing so, ensure the fix or an equivalent is applicable,
-submitted, or already present in all newer stable trees still supported. This is
-meant to prevent regressions that users might later encounter on updating, if
-e.g. a fix merged for 5.19-rc1 would be backported to 5.10.y, but not to 5.15.y.
+stable series, one way to do so is by specifying the target series in the
+subject prefix (e.g. '[PATCH stable 5.15 5.10]' asks that the patch to be
+included in both 5.10.y and 5.15.y). When doing so, ensure the fix or an
+equivalent is applicable, submitted, or already present in all newer stable
+trees still supported. This is meant to prevent regressions that users might
+later encounter on updating, if e.g. a fix merged for 5.19-rc1 would be
+backported to 5.10.y, but not to 5.15.y.
 
 .. _option_1:
 
-- 
2.45.1

